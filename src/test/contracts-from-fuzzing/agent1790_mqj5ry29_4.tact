struct OptNest {
    flag: Bool;
    opt1: Int?;
    opt2: Bool?;
    opt3: Address?;
    optDeep: Inner?;
}

struct Inner {
    x: Int;
    y: Int?;
}

contract OptionalTest {
    data: OptNest;

    init() {
        self.data = OptNest{
            flag: false,
            opt1: null,
            opt2: true,
            opt3: null,
            optDeep: Inner{x: 5, y: null}
        };
    }
}
