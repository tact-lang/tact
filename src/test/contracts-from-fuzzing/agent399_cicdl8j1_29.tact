struct StructWithOptionals {
  a: Int?;
  b: String?;
  c: Address?;
}

struct StructWithStructs {
  sa: StructWithOptionals;
  sb: StructWithOptionals;
}

contract NestedOptionalStructsTest {
  complex: StructWithStructs;

  init() {
    self.complex = StructWithStructs{
      sa: StructWithOptionals{ a:null, b:null, c:null },
      sb: StructWithOptionals{ a:null, b:null, c:null }
    };
  }
}