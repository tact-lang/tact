struct OptionalNested {
  innerOpt: Int?;
}

contract OptInitVal {
  data: OptionalNested = OptionalNested{innerOpt: null};
}
