// very deeply nested struct stack to test edge
struct L1 { v: Int; }
struct L2 { x: L1; }
struct L3 { x: L2; }
struct L4 { x: L3; }
struct L5 { x: L4; }
struct L6 { x: L5; }
struct L7 { x: L6; }
struct L8 { x: L7; }

contract VeryDeepNested {
    value: L8;

    init() {
        self.value = L8{ x: L7{ x: L6{ x: L5{ x: L4{ x: L3{ x: L2{ x: L1{ v: 42 } } } } } } } };
    }
}