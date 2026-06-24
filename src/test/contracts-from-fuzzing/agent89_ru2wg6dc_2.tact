contract TestPrimitive {
  fun run() {
    let x: Int = 1 + 2;              // 3
    let y: Bool = true && false;       // false
    let s: String = "Hello";         // "Hello"
    let a: Address = myAddress();      // current contract address
    let c: Cell = emptyCell();         // an empty cell
    dump(x);
    dump(y);
    dump(s);
    dump(a);
    dump(c);
  }
  receive() { self.run(); }
}
