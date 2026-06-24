struct Innermost {
    num: Int?;
}

struct Nested {
    innermost: Innermost?;
}

contract OptionalChain {
    storage: Nested;

    init() {
        self.storage = Nested { innermost: null };
    }
}