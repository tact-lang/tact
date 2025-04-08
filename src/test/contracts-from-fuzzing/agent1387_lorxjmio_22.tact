struct O1 {
  x: Int?;
}

struct O2 {
  x: O1?;
}

struct O3 {
  x: O2?;
}

contract TestContract {
  data: O3;

  init() {
    self.data = O3{ x: null };
  }
}