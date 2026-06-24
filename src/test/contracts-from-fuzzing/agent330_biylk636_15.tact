struct EmptyWrap {
  nothing: Int?;
}

contract OnlyNull {
  e: EmptyWrap;

  init() {
    self.e = EmptyWrap{ nothing: null };
  }
}
