// struct with optional fields with default values
struct DOpt {
  a: Int? = null;
  b: Bool? = null;
}

contract DefaultsOptTest {
  rec: DOpt;

  init() {
    self.rec = DOpt{};
  }
}
