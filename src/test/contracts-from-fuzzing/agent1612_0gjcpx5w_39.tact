// test: optional entire nested struct
struct Inner {
    x: Int;
}

contract OptionalWholeStruct {
    val: Inner?;

    init() {
        self.val = null;
    }
}
