struct SubStruct1 { a: Int; b: Bool?; }
struct SubStruct2 { x: Int; y: SubStruct1; }
struct SubStruct3 { m: Int; n: SubStruct2; }

contract TestContract {
  field: SubStruct3;

  init() {
    self.field = SubStruct3{
      m: 8,
      n: SubStruct2{
        x: 7,
        y: SubStruct1{a: 6, b: null},
      },
    };
  }
}