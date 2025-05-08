struct ManyNulls {
  a: String? = null;
  b: String? = null;
  c: String? = null;
  d: String? = null;
  e: String? = null;
  f: String? = null;
}

contract LotsOfNull {
  data: ManyNulls;

  init() {
    self.data = ManyNulls{};
  }

  receive() { dump(0); }
}