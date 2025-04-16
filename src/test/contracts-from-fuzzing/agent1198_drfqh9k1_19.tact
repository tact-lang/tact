struct Defaults {
    foo: Int = 3;
    bar: Bool?;
    baz: String = "hi";
}

contract DefaultsParam(
    defaults: Defaults,
) {
    receive() {
        let _ = self.defaults;
    }
}