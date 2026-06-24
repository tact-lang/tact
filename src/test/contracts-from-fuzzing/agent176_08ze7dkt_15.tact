struct NestedOptional {
    a: String;
    b: Bool;
}

contract OptionalEmbed {
    ref: NestedOptional?;
    init() {
        self.ref = NestedOptional{ a: "hi", b: true };
    }
}