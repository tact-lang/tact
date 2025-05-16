struct Inner {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    str: String;
}

contract TestContract {
    val: Inner;

    init() {
        self.val = Inner{
            a: 1,
            b: null,
            c: true,
            d: null,
            str: "hi"
        };
    }
}