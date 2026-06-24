struct Leaf { val: Int; }
struct Mid { leaf: Leaf?; }
struct Top { mid: Mid; }

contract OptionalDeepInit {
    root: Top = Top{ mid: Mid{ leaf: null } };
}