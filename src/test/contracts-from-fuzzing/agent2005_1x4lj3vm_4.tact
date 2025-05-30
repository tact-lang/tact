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
    s: DeeperNested;

    init() {
        self.s = DeeperNested{
            s1: NestedOptional{
                x: 3,
                y: null,
                z: myAddress(),
            },
            flag: false,
        };
    }
}