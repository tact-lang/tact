message Indo {  x: Int }

struct Holder {
  m: Indo?;
}

contract Test {
  h: Holder = Holder{ m: null };
}
