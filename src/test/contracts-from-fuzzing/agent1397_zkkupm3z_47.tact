// optional struct in struct with defaults
struct Sub {
    foo: Int = 1;
    bar: Bool = false;
}
struct WrapOpt {
    inner: Sub?;
    label: String = "default";
}

contract OptionalWrap {
    data: WrapOpt;

    init() {
        self.data = WrapOpt{ inner: null };
    }
}