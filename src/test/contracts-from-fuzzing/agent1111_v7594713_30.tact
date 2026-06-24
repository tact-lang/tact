// test contract parameter style with nested optional structs
struct Child { x: Int; y: Bool?; }
struct Parent { c: Child?; }
contract ParamOptStruct(
  id: Int,
  data: Parent
) {
 receive() {
   let _ = self.id + 1;
 }
}