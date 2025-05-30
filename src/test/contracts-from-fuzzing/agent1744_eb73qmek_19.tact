// test default values with explicit null for optionals
struct DefaultNulls {
  num: Int? = null;
  txt: String? = null;
  addr: Address? = null;
}

contract DefNullsStorage {
  d: DefaultNulls;

  init() {
    self.d = DefaultNulls{};
  }
}
