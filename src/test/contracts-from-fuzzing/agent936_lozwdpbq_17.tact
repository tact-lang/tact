// Testing persistent optional struct variable that nests optional field
struct InnerOpt {
  flag: Bool?;
}

contract TestContract {
  data: InnerOpt?;

  init() {
    self.data = InnerOpt{ flag: true };
  }
}
