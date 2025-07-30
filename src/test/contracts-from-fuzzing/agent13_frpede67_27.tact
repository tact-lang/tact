// nested structs, one with many optionals
struct SubData {
  a: Int?;
  b: Int?;
  c: String?;
  d: Address?;
  e: Cell?;
  f: Slice?;
}

struct Container {
  sub: SubData;
  flag: Bool;
  val: Int;
}

contract TestContract {
    field: Container;
    init() {
      self.field = Container {
        sub: SubData{a:null, b:null, c:null, d:null, e:null, f:null},
        flag: false,
        val: 0
      };
    }
}