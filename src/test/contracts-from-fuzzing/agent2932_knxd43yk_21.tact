struct Outer {
    inn: Inner;
}

struct Inner {
    nested: Nested;
}

struct Nested {
    v: Int;
}

contract InnerContract {
    data: Outer;

    init() {
        self.data = Outer{
            inn: Inner{
                nested: Nested{ v: 69 }
            }
        };
    }
}