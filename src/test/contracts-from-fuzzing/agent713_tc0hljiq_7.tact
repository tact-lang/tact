struct Params {
    foo: Int = 10;
    bar: Bool?;
    baz: String = "default";
}

contract Defaults {
    p: Params;
    init() {
        self.p = Params{
            bar: null
        };
    }
}