struct D1 { inner: D2?; val: Int }
struct D2 { inner: D3?; flag: Bool }
struct D3 { inner: D4?; text: String }
struct D4 { value: Int }

contract DeepNulls {
  data: D1;

  init() {
    self.data = D1 {
      inner: null,
      val: 42
    };
  }
}