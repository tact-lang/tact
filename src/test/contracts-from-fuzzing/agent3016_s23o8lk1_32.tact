struct OptNested {
    a: Int?;
    b: Bool?;
    nested: Inner?;
}

struct Inner {
    s: String;
    flag: Bool;
}

contract TestContract {
    data: OptNested;

    init() {
        self.data = OptNested{
            a: null,
            b: null,
            nested: null
        };
    }
}