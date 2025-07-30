struct DeeplyNested {
    inner1: InnerOne;
    flag: Bool;
}

struct InnerOne {
    x: Int;
    inner2: InnerTwo;
}

struct InnerTwo {
    y: Int;
    inner3: InnerThree;
}

struct InnerThree {
    z: Bool;
}

contract PersistDeep {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            inner1: InnerOne{
                x: 5,
                inner2: InnerTwo{
                    y: 10,
                    inner3: InnerThree{ z: true }
                }
            },
            flag: false
        };
    }
}