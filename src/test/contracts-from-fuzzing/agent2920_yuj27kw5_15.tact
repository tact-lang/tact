struct NestedWithOptionalDefaults {
    id: Int = 1;
    name: String?;
}

struct Container {
    inner: NestedWithOptionalDefaults;
}

contract OptionalDefaultsContract {
    data: Container;

    init() {
        self.data = Container{
            inner: NestedWithOptionalDefaults{
                name: null
            }
        };
    }
}