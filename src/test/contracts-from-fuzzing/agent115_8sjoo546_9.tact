// testing optional deeply nested structs inside optional contract field
struct Layer3 { val: Int; }
struct Layer2 { l3: Layer3?; }
struct Layer1 { l2: Layer2?; }

contract Test {
    s: Layer1?;

    init() {
        self.s = Layer1{ l2: Layer2{ l3: Layer3{ val: 7 } } };
    }
}