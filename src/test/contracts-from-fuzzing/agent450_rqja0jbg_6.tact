struct InnerMost {
    z: Int;
}

struct Middle {
    mopt: InnerMost?;
    flag: Bool?;
}

struct Outer {
    id: Int;
    middle: Middle?;
}

contract NestedOptionals {
    value: Outer;

    init() {
        self.value = Outer{
            id: 100,
            middle: Middle{
                mopt: InnerMost{ z: 999 },
                flag: true,
            }
        };
    }
}