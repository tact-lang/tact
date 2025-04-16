struct DeepOpt {
  innerOpt: String?;
}

struct NestedOpt {
  deep: DeepOpt?;
}

contract OptTest {
  nested: NestedOpt = NestedOpt{ deep: null };
  init() {}
}