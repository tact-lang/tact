struct OuterOptStruct {
  os: Int?;
  name: String?;
}

contract OptOfStructOpt {
  inner: OuterOptStruct?;

  init() {
    self.inner = null;
  }
}