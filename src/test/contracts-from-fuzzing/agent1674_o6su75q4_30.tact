struct Child {
    score: Int? = null;
    passed: Bool = false;
}

struct Parent {
    status: String = "unknown";
    child: Child?;
}

contract DefaultsNestedOptions {
    state: Parent;

    init() {
        self.state = Parent{
            status: "running",
            child: null,
        };
    }
}