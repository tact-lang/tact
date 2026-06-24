struct Nested {
    deepVal: Int?;
    deeper: Inner;
}

struct Inner {
    a: Int;
    b: Bool?;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{
            deepVal: null,
            deeper: Inner{
                a: 1,
                b: true
            }
        };
    }
}