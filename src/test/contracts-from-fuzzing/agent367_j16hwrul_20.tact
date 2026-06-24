// optional field of a deeply nested struct with default values as well
struct InnerD {
    value: Int = 5;
    label: String = "hi";
}

struct Wrapper {
    inner: InnerD?;
}

contract OptionalDefaults {
    data: Wrapper;

    init() {
        self.data = Wrapper { inner: null };
    }
}