struct EmptyStrOpt {
  a: String?;
}

contract NonInitOptStr {
  data: EmptyStrOpt;

  init() {
    self.data = EmptyStrOpt{
      a: null,
    };
  }
}