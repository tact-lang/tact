// deeply nested string optionals
struct O1 { s: String?; }
struct O2 { o: O1?; }
struct O3 { o: O2?; }

contract TestContract {
  deep: O3;

  init() {
    self.deep = O3 {
      o: O2 {
        o: O1 {
          s: null
        }
      }
    };
  }
}