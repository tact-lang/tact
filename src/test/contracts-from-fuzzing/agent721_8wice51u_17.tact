struct InnerMost { x: Int }
struct Middle { m: InnerMost }
struct Outer { o: Middle }

contract ChangeNested {
  field: Outer = Outer{ o: Middle{ m: InnerMost{ x: 1 } } };
  receive() {
    self.field = Outer{ o: Middle{ m: InnerMost{ x: 42 } } };
  }
}