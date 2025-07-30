struct Inn {
  v: Int?;
}

struct Outt {
  s: Inn?;
}

contract NestedOptionParam(
  data: Outt?,
) {}
