struct LargeNested {
    a: Int;
    b: Bool;
    c: NestedOptional;
    d: DeeperNested;
}

struct NestedOptional {
    x: Int?;
    y: Bool?;
    z: Address?;
}

struct DeeperNested {
    s1: NestedOptional;
    flag: Bool;
}

contract TestContract {
    s: LargeNested;

    init() {
        self.s = LargeNested{
            a: 7,
            b: true,
            c: NestedOptional{
                x: null,
                y: true,
                z: null,
            },
            d: DeeperNested{
                s1: NestedOptional{
                    x: 3,
                    y: null,
                    z: myAddress(),
                },
                flag: false,
            },
        };
    }
}