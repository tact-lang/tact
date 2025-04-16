struct Inner1 {
    val: Int;
}

struct Inner2 {
    inner: Inner1;
    label: String;
    optFlag: Bool?;
}

contract TestNestedOptional {
    storage: Inner2?;

    init() {
        self.storage = Inner2{
            inner: Inner1{ val: 88 },
            label: "hi",
            optFlag: null,
        };
    }
}
