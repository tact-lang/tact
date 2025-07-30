struct DeepOptionalDefaults {
    nested: Inner?;
}

struct Inner {
    foo: Int = 1;
    bar: Bool?;
}

contract OptDefaultsContract {
    data: DeepOptionalDefaults;

    init() {
        self.data = DeepOptionalDefaults{
            nested: Inner{
                foo: 10,
                bar: null
            }
        };
    }
}