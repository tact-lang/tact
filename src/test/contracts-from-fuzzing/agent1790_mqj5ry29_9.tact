struct Layer3 {
    data: Int;
}

struct Layer2 {
    n: Layer3;
}

struct Layer1 {
    n: Layer2;
}

contract NestedLevels {
    s: Layer1?;

    init() {
        self.s = Layer1{
            n: Layer2{
                n: Layer3{data:123}
            }
        };
    }
}
