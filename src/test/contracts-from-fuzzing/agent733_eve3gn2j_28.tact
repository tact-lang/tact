struct Meta {
  tag: String;
}

struct Wrapper {
  meta: Meta?;
}

contract TestContract(
  w: Wrapper
) {}