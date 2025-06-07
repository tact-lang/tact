struct Nested {
    a: Int;
    b: Int?;
}

struct Wrapper {
    nested: Nested;
    flag: Bool;
}

contract DeepTest {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            nested: Nested{
                a: 7,
                b: null,
            },
            flag: true,
        };
    }
}