struct Leaf { val: Int; }          // no default
struct Mid { leaf: Leaf; }           // no default
struct Outer { mid: Mid?; }          // optional

contract Test {
    st: Outer;
    init() {
        self.st = Outer{ mid: Mid{ leaf: Leaf{ val: 42 } } };
    }
}