struct Recursion1 {
  inner: Recursion2;
}
struct Recursion2 {
  inner: Recursion3;
}
struct Recursion3 {
  inner: Recursion4;
}
struct Recursion4 {
  inner: Recursion5;
}
struct Recursion5 {
  field: Int;
}

contract DeepRecursion {
  store: Recursion1;

  init() {
    self.store = Recursion1{
      inner: Recursion2{
        inner: Recursion3{
          inner: Recursion4{
            inner: Recursion5{field: 42}
          }
        }
      }
    };
  }
}