# Assume points hash always has more than 1 point
def find_closest_points(points)
  length = points.count
  closestPoints = Hash.new
  point_keys = points.keys
  
  (0..length-2).each do |i|
    foundPoints = find_closest_to_point(i, points, point_keys)
    if !closestPoints[:distance] || foundPoints[:distance] < closestPoints[:distance]
      closestPoints[:distance] = foundPoints[:distance]
      closestPoints[:point1] = foundPoints[:point1]
      closestPoints[:point2] = foundPoints[:point2]
    end
  end
  closestPoints
end

def find_closest_to_point(point_pos, points, point_keys)
  found = Hash.new
  (point_pos+1..points.length-1).each do |i|
    distance = calc_distance(points[point_keys[point_pos]], points[point_keys[i]])
    if !found[:distance] || distance < found[:distance]
      found[:distance] = distance
      found[:point1] = points[point_keys[point_pos]]
      found[:point2] = points[point_keys[i]]
    end
  end
  found
end

def calc_distance(point1, point2)
  Math.sqrt((point2[:x] - point1[:x])**2 + (point2[:y] - point1[:y])**2)
end

points = {}
points[:a] = {x: -2, y: 1}
points[:b] = {x: 1, y: 5}
points[:c] = {x: 5, y: 2}
points[:d] = {x: 5, y: 1}

closestPoints = find_closest_points(points)
puts "The two closest points are: #{closestPoints[:point1]} and #{closestPoints[:point2]}"
puts "The distance between the two points is: #{closestPoints[:distance]}"