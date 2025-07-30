struct MultiOpt {
  i: Int?;
  s: String?;
  b: Bool?;
}

contract FullNullsTest {
  data: MultiOpt = MultiOpt{
    i: null,
    s: null,
    b: null
  };

  init() {}
}
