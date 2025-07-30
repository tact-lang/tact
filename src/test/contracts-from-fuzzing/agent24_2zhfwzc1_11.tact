struct InnerA {
    a: Int;
}

struct InnerB {
    b: String;
}

struct Outer {
    one: InnerA;
    two: InnerB;
}

contract MultiNestedStructsTest {
    payload: Outer;

    init() {
        self.payload = Outer{
            one: InnerA{ a: 5 },
            two: InnerB{ b: "hi" },
        };
    }
}