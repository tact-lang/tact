struct InnerOpt {
  flag: Bool?;
  msg: String?;
}

struct Wrapper {
  inner: InnerOpt;
  id: Int;
}

contract TestContract {
  wrapped: Wrapper;

  init() {
    self.wrapped = Wrapper{
      inner: InnerOpt{
        flag: null,
        msg: null
      },
      id: 55
    };
  }
}