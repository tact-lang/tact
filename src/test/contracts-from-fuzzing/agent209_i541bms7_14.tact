// Struct with many nested structs inside contract field
struct Leaf1 { a: Int; }
struct Leaf2 { b: Bool; }
struct Leaf3 { c: String; }
struct Middle {
    l1: Leaf1;
    l2: Leaf2;
    l3: Leaf3;
}

contract ManyNestedStructs {
    m: Middle;

    init() {
        self.m = Middle{
            l1: Leaf1{a: 1},
            l2: Leaf2{b: false},
            l3: Leaf3{c: "hi"}
        };
    }
}