struct CombineManyTypesOptional {
  i: Int?;
  b: Bool?;
  a: Address?;
  s: String?;
  c: Cell?;
  sl: Slice?;
}

contract ComboOptTest {
  f: CombineManyTypesOptional;

  init() {
    self.f = CombineManyTypesOptional{
      i:null,b:null,a:null,s:null,c:null,sl:null
    };
  }
}