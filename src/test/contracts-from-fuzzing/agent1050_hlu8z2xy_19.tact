struct ABool {
    a: Bool;
}

struct OptABool {
    b: ABool?;
}

contract OptionalStructField {
    val: OptABool;

    init() {
        self.val = OptABool{
            b: null
        };
    }
}
