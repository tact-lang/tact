struct StringOpt {
  s: String?;
}

contract StringOptStorage {
  data: StringOpt;
  init() {
    self.data = StringOpt{ s: null };
  }
}
