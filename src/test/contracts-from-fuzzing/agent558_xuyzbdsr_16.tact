// Testing optional struct deeply nested field
struct DeepOpt {
  val: Int?;
}

struct MidOpt {
  val: DeepOpt?;
}

struct TopOpt {
  val: MidOpt?;
}

contract Test {
  f: TopOpt = TopOpt{ val: null };
}