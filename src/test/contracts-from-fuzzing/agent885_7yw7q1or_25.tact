// optional of struct containing other structs (nested optional at contract level)
struct Leaf { val: Int }

struct Middle1 { a: Leaf; b: Leaf }

struct Middle2 { c: Leaf; d: Leaf }

struct Container { m1: Middle1; m2: Middle2 }

contract OptionalContainer {
    data: Container?;

    init() {
        self.data = null;
    }
}
