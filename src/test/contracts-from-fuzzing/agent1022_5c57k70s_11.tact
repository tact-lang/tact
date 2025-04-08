struct Params {
    foo: Int = 10;
    bar: String = "z";
    baz: Bool = false;
}

contract TestContract {
    p: Params;

    init() {
        self.p = Params{
            bar: "override",
        };
    }

    receive() {}
}