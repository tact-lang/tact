struct OptStr {
  s: String?;
}

struct OptInt {
  i: Int?;
}

struct Mix {
  s: OptStr?;
  i: OptInt?;
}

contract NestedOptionalsMix {
  store: Mix;
  init(){
    self.store = Mix{s:null,i:null};
  }
}