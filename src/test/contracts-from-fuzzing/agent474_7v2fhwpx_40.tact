// Contract with lots of nested optional structs
struct Leaf { val: Int }
struct Mid { child: Leaf? }
struct Top { kid: Mid? }

contract Test {
  storage: Top?;

  init() {
    self.storage = Top{
      kid: Mid{
        child: Leaf{val:42}
      }
    };
  }
}
