struct InnerBool {
    b: Bool;
}

struct OuterOptBool {
    inner: InnerBool?;
}

contract NestedBoolOptional {
    val: OuterOptBool;

    init() {
        self.val = OuterOptBool{ inner: null };
    }
}