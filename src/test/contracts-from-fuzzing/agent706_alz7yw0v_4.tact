struct Inner {
    i: Int;
    b: Bool;
    s: String;
}

contract TestContract {
    field: Inner;

    init() {
        self.field = Inner{
            i: 10,
            b: true,
            s: "data",
        };
    }
}