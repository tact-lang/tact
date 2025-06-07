struct Deep {
    level1: Int;
    level2: Inner;
}

struct Inner {
    x: Int;
    y: Bool;
    name: String;
    optionalVal: Int?;
    optionalName: String?;
}

contract TestContract {
    deep: Deep;

    init() {
        self.deep = Deep{
            level1: 42,
            level2: Inner{
                x: 1,
                y: true,
                name: "inner",
                optionalVal: null,
                optionalName: null
            }
        };
    }

    receive() {}
}