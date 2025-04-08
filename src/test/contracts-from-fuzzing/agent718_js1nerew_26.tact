struct NestedComplex {
    a: Int;
    b: LevelOne;
}

struct LevelOne {
    x: Int;
    y: LevelTwo;
    z: Bool?;
}

struct LevelTwo {
    s: String;
    t: Cell?;
}

contract TestContract {
    nestedData: NestedComplex;

    init() {
        self.nestedData = NestedComplex{
            a: 7,
            b: LevelOne{
                x: 8,
                y: LevelTwo{
                    s: "hello",
                    t: null
                },
                z: true
            }
        };
    }
}