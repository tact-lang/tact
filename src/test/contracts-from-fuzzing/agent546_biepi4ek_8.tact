struct NestedOptional {
    inner: Int?;
}

struct OuterOpt {
    nested: NestedOptional?;
    s: String;
}

contract MixOptional {
    val: OuterOpt;

    init() {
        self.val = OuterOpt{
            nested: NestedOptional{ inner: 42 },
            s: "hello"
        };
    }
}