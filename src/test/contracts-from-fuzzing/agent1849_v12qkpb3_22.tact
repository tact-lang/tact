struct MultiLevelOptionalDefaults {
  s: SubOptional?;
}

struct SubOptional {
  f: Int = 1;
}

contract ChainOptionalDefaults {
  data: MultiLevelOptionalDefaults;

  init() {
    self.data = MultiLevelOptionalDefaults{ s: null };
  }
}