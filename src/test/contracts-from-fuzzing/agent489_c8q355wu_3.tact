contract ChainNestedOpt {
    first: Nested?;

    init() {
        self.first = Nested{ second: Nested2{ third: 123 } };
    }
}

struct Nested {
    second: Nested2?;
}

struct Nested2 {
    third: Int?;
}
