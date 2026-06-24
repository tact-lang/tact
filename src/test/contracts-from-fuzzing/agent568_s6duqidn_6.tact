struct NestedOptional {
    a: Int?;
    b: Bool?;
}

struct Wrapper {
    nested: NestedOptional?;
}

contract NestedOptionalTest {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            nested: NestedOptional{
                a: 42,
                b: null
            }
        };
    }
}