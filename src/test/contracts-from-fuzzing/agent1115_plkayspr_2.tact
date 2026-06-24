struct Inner {
    flag: Bool;
    txt: String;
}

struct Outer {
    val: Int;
    opt_inner: Inner?;
}

contract DeepOption {
    field: Outer;

    init() {
        self.field = Outer {
            val: 77,
            opt_inner: Inner { flag: false, txt: "hello" }
        };
    }
}
