struct TupleLike { a:Int; b:Bool; c:String; d:Int?; e:Bool?; f:String?; }

contract FlatTupleLike(
    x: Int,
    y: TupleLike,
    z: TupleLike?,
) {}