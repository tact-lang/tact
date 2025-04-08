// test contract parameter style with lots of nested struct fields
struct DeepParam {
 a: Int?;
 b: Bool?;
}
contract ParamStyle(
 p1:Int,
 p2:Bool,
 deep:DeepParam
) {
 receive() {
   let _ = self.p1 + 1;
 }
}