// nested struct param with optional
struct DeepOpt {
  vv: Int?;
}

struct Mid {
  mm: DeepOpt;
}

contract Test(
  nested: Mid
) {}