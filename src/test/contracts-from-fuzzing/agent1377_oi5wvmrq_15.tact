struct Sub {
  flag: Bool?;
  count: Int;
}

struct Wrap {
  label: String?;
  inner: Sub;
}

contract TestContract {
  data: Wrap?;

  init() {
    self.data = Wrap{
      label:"check",
      inner: Sub{flag:true,count:7}
    };
  }
}