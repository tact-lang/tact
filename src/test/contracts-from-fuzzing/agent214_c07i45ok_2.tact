struct Inner {
    xi: Int;
    xb: Bool;
    xs: String;
}

contract TestContract {
    val: Inner;

    init() {
        self.val = Inner{
            xi: 42,
            xb: false,
            xs: "ok",
        };
    }
}