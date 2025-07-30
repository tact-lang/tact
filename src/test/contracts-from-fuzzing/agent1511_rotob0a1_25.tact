struct EmptyContainer {
  opt: OptStruct?;
}

struct OptStruct {
  data: String;
}

contract NullableStructs {
  content: EmptyContainer;

  init() {
    self.content = EmptyContainer{ opt: null };
  }
}
