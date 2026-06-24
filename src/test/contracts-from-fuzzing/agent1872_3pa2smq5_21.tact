struct Variant1 {
    a: Int;
    b: Bool?;
}

struct Variant2 {
    s: String;
    ref: Variant1;
}

contract IndirectOptional {
    val: Variant2;

    init() {
        self.val = Variant2{
            s: "text",
            ref: Variant1{ a: 42, b: null },
        };
    }
}