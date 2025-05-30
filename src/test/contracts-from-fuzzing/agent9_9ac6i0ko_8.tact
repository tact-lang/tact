struct NestedOptional {
    foo: Nested?;
}

struct Nested {
    flag: Bool;
    number: Int;
}

contract WithNestedOptional {
    val: NestedOptional = NestedOptional{ foo: null };
    
    init() {
        self.val = NestedOptional{ foo: Nested{ flag: true, number: 7 } };
    }
}