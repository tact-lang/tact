struct Base1 { a: Int; }
struct Base2 { b: Bool; }
struct Nested {
    s1: Base1;
    s2: Base2;
    optS1: Base1?;
    optS2: Base2?;
}

contract ComposeStructs {
    val: Nested;

    init() {
        self.val = Nested{
            s1: Base1{a: 7},
            s2: Base2{b: true},
            optS1: null,
            optS2: null,
        };
    }
}