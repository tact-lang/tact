struct Inner {
    x: Int;
    y: Int;
    s: String;
    flag: Bool;
}

contract OptionalStructVar {
    val: Inner?;

    init() {
        self.val = Inner{
            x: 1,
            y: 2,
            s: "ok",
            flag: true
        };
    }
}