struct Inner {
    foo: Int?;
    flag: Bool?;
}

struct Outer {
    innerOpt: Inner?;
    note: String?;
}

contract Test2 {
    data: Outer;

    init() {
        self.data = Outer{
            innerOpt: null,
            note: null,
        };
    }
}