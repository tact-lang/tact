struct Inner {
    value: Int?;
}

struct Outer {
    nested: Inner;
    flag: Bool?;
}

contract DeepOptionals {
    data: Outer;
    init() {
        self.data = Outer{
            nested: Inner{
                value: null
            },
            flag: null
        };
    }
}