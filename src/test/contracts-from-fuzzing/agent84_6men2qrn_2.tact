struct Nested {
    inner1: Int;
    inner2: Bool?;
}

struct Wrapper {
    nested: Nested;
    flag: Bool;
}

contract NestTest {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            nested: Nested{
                inner1: 5,
                inner2: null,
            },
            flag: true,
        };
    }
}