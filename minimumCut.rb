#Ruby

$minimumCut = 99

def getMatrix
  matrixData = File.readlines("hw3.txt")
  matrix = []
  for i in 0...matrixData.count
    matrix << matrixData[i].split
  end
  return matrix
end

def getMiniumCutFromMatrix(matrix)
  
  
  indexA = rand(matrix.count)
  vertexA = matrix[indexA]

  indexBinA = rand(1...vertexA.count)
  
  valueA = vertexA[0]
  valueB = vertexA[indexBinA]
  
  for i in 0...matrix.count
    if i == indexA
      next 
    end
    if matrix[i][0] == valueB
      
      vertexB = matrix.delete_at(i)
      break
    end
  end

  # combine A and B
  vertexA << vertexB
  vertexA.flatten!
  vertexA.delete(valueA)
  vertexA.delete(valueB)
  vertexA.unshift(valueA)

  

  for i in 0...matrix.count
      matrix[i].map! { |x| x == valueB ? valueA : x } 
  end

end

for i in 1..10
  matrix = getMatrix
  for i in 1..198
    getMiniumCutFromMatrix(matrix)
  end
  i = matrix[0].count
  i = i -1
  if i < $minimumCut
    $minimumCut = i
  end
end

puts "#{$minimumCut}"  