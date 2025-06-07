struct ComplexNested {
    level1: Level1;
}

struct Level1 {
    list: map<Int, Level2>;
}

struct Level2 {
    opt: Level3?;
}

struct Level3 {
    deepVal: Int;
}

contract Test {
    state: ComplexNested;

    init() {
        self.state = ComplexNested{
            level1: Level1{
                list: emptyMap()
            }
        };
    }
}