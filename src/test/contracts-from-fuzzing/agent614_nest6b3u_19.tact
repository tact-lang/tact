struct NestedOptDefault {
  a: Int;
  b: String? = null;
}

struct TopLevel {
  inner: NestedOptDefault? = null;
  flag: Bool;
}

contract TestContract {
  storage: TopLevel;

  init() {
    self.storage = TopLevel{
      inner: NestedOptDefault{a:10,b:"hello"},
      flag:true
    };
  }
}