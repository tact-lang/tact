struct Inner {
    a: Int;
    b: Bool?;
    c: String;
}

struct Middle {
    x: Int;
    y: Inner?;
}

contract TestDeepNestedOpt {
    field: Middle?;

    init() {
        self.field = null;
    }

    receive() {
        let tmp: Middle? = self.field;
    }
}