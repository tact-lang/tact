struct OneNestedOptional {
  inner: Int?;
}

struct AnotherLevel {
  nested: OneNestedOptional?;
}

contract MultiLvlOpt {
  nested: AnotherLevel;

  init() {
    self.nested = AnotherLevel{
      nested: null
    };
  }
}
