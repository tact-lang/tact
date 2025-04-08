struct Leaf { value: Int; }
struct Mid { leaf: Leaf; }
struct Top { mid: Mid; }

contract SameNames {
    ddd: Top;

    init() {
        self.ddd = Top{ mid: Mid{ leaf: Leaf{ value: 123 } } };
    }
}