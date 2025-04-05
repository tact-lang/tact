fun doSomething(a: Int): Int {
  return a + 42;
}

contract TestContract {
  receive() {
    let x = 123;
    doSomething(x);
  }
}
