struct DeepOptDefaults {
    inner: InnerOptDefault?;
}

struct InnerOptDefault {
    foo: Int = 99;
    bar: Bool = false;
}

contract DeepOptDefaultsStore {
    data: DeepOptDefaults;

    init() {
        self.data = DeepOptDefaults{
            inner: null
        };
    }
}