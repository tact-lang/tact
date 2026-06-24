fun bar(x: Int) {
  // do something
}

contract Test {
    receive() {
        let x = 5;
        bar(x);
    }
}