struct Inner {
    bval: Bool;
    sval: String;
    num: Int;
}

contract TestContract {
    data: Inner;

    init() {
        self.data = Inner{
            bval: true,
            sval: "test",
            num: 10,
        };
    }
}