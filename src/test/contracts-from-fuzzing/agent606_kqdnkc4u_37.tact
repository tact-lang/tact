struct Leaf { foo: Int; }
struct Mid { leaf: Leaf?; }
struct Container { mid: Mid; }

contract Test {
    c: Container = Container{ mid: Mid{ leaf: null } };
}