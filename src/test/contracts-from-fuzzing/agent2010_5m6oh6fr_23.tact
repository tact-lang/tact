struct Last {
    message: String;
}

struct MiddleOpt {
    last: Last?;
    data: String;
}

contract OptionalNestedDeeper {
    val: MiddleOpt;

    init() {
        self.val = MiddleOpt{
            last: Last{ message: "Hello" },
            data: "test",
        };
    }
}