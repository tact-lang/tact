struct Small {
  z: Int;
}

struct Big {
  inner: Small;
  desc: String;
}

contract TestContract {
  data: Big?;

  init() {
    self.data = Big{
      inner: Small{z: 42},
      desc: "optional nested"
    };
  }
}