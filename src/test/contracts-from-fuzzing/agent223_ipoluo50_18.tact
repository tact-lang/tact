struct OptionalDeeplyNested {
    a: Inner1?;
}

struct Inner1 {
    b: Inner2?;
}

struct Inner2 {
    c: Int?;
}

contract OptionalDeepNestTest {
    data: OptionalDeeplyNested;

    init() {
        self.data = OptionalDeeplyNested{
            a: null
        };
    }
}