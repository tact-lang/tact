//// Valid tests for various types in Tact

contract TestPrimitiveInt() {
  fun run() {
    let a: Int = 1;
    let b: Int = 2;
    let c: Int = a + b;
    dump(c); // expected output: 3
  }
  receive() { self.run(); }
}

contract TestOptionalValid() {
  fun run() {
    let op: Int? = null;
    op = 100;
    dump(op!!); // expected output: 100
  }
  receive() { self.run(); }
}

struct MyStruct { x: Int; y: Bool; }
contract TestStructValid() {
  fun run() {
    let s: MyStruct = MyStruct{ x: 10, y: true };
    dump(s.x); // expected output: 10
  }
  receive() { self.run(); }
}

contract TestMapValid() {
  fun run() {
    let m: map<Int, Int> = emptyMap();
    m.set(1, 42);
    dump(m.get(1)!!); // expected output: 42
  }
  receive() { self.run(); }
}

message TestMsg { val: Int as uint8; }
contract TestMessageValid() {
  fun run() {
    let m = TestMsg{ val: 42 };
    dump(m.val); // expected output: 42
  }
  receive() { self.run(); }
}

contract TestCellValid() {
  fun run() {
    let bb: Builder = beginCell().storeUint(10, 4);
    let c: Cell = bb.endCell();
    dump(c); // expected: a cell with 4 bits, value 10
  }
  receive() { self.run(); }
}
