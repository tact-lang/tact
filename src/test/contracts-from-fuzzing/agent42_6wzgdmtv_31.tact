// Nested optional field in struct (non-nested opt type, nested inside a struct)
struct OptWrap {
  inner: Int?;
}

contract TestContract {
  data: OptWrap;

  init() {
    self.data = OptWrap{ inner: null };
  }
}