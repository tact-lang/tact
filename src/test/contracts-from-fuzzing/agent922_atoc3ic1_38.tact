struct Deep {
 a:Int; b:Bool; c:String; d:Int?; e:Bool?; f:String?;
}

contract P(
  p1:Deep,
  p2:Deep?,
  p3:Deep,
  p4:Deep?,
  x:Int,
  y:Bool?,
  z:String,
) {}