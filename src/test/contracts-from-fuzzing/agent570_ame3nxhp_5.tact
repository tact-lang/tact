struct SubStruct {
  x: Int;
}

struct MainStruct {
  maybeSub: SubStruct?;
}

contract Test {
  value: MainStruct;

  init() {
    self.value = MainStruct{
      maybeSub: null
    };
  }
}