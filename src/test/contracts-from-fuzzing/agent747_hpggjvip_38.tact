struct Child {
    a: Int = 12;
    b: Bool?;
    c: String = "x";
}

struct Mid {
    child: Child?;
    note: String = "hello";
}

contract TestContract {
    val: Mid;

    init() {
        self.val = Mid {
            child: null,
            note: "ready",
        };
    }
}