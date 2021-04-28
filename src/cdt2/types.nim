import vectors

type
  ConstraintID* = distinct int

  QuadEdgeID* = distinct int

  EdgeID* = distinct int

  VertexID* = distinct int

type
  #Vector* = Vector3
  Vector* = Vector2



type
  Vertex* = ref object of RootRef
    point*: Vector
    edge*: Edge
    id*: VertexID
    seqPos*: int
    mark*: int

  QuadEdge* = ref object
    e*: array[4, Edge]
    crep*: seq[ConstraintID]
    id*: QuadEdgeID
    mark*: int

  Edge* = ref object
    quadEdge*: QuadEdge
    vertex*: Vertex
    next*{.cursor.}: Edge
    num*: int # 0 .. 3

type
  VertexAllocProc* = proc(): Vertex

proc `$`*(v: Vertex): string =
  result = '(' & $v.point.x & ", " & $v.point.y
  when v.point is Vector3:
    result = result & ", " & $v.point.z
  when v.point is Vector4:
    result = result & ", " & $v.point.w
  result = result & ')'
