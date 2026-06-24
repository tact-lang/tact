struct SubSub {
  q: Int;
}

struct Sub {
  s: SubSub;
}

struct Main {
  m: Sub;
}

contract TestContract(
  data: Main
) {}