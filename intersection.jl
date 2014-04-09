
type Point
  x::Real
  y::Real
end

type Line
  a::Point
  b::Point
end

function oppositeSides(a::Point, b::Point, l::Line)
  g = (l.b.x - l.a.x)*(a.y - l.a.y) - (l.b.y - l.a.y)*(a.x - l.a.x)
  h = (l.b.x - l.a.x)*(b.y - l.a.y) - (l.b.y - l.a.y)*(b.x - l.a.x)
  return g*h <= 0.0
end

function boundingBox(rs, pq)
  return min(rs.a.x, rs.b.x) < max(pq.a.x, pq.b.x) && 
    max(rs.a.x, rs.b.x) > min(pq.a.x, pq.b.x) && 
    min(rs.a.y, rs.b.y) < max(pq.a.y, pq.b.y) &&
    max(rs.a.y, rs.b.y) > min(pq.a.y, pq.b.y)
end

function intersect(rs, pq)
  return boundingBox(rs, pq) && 
    oppositeSides(rs.a, rs.b, pq) && 
    oppositeSides(pq.a, pq.b, rs)
end
