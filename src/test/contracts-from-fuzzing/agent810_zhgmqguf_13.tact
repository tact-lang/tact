struct ManyOptionalNested {
    s1: Inner?;
    s2: Inner?;
    s3: Inner?;
}

struct Inner {
    value: String?;
    flag: Bool;
}

contract TestContract {
    x: ManyOptionalNested;
    init() {
        self.x = ManyOptionalNested{
            s1: null,
            s2: Inner{ value: null, flag: true },
            s3: Inner{ value: "a", flag: false },
        };
    }
}