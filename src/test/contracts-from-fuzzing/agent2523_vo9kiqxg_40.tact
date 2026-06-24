// nested inside parameter using defaults and optionals
struct Leaf {
 a:Int=1;
 b:String?;
}
contract NestParam(
  x: Leaf?,
  y: Leaf,
) {}
