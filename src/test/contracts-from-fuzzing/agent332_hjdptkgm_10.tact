struct NestedOptional {
    inner: Level;
}

struct Level {
    foo: Int?;
    boo: Bool?;
    str: String?;
}

contract TestContract {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            inner: Level{
                foo: null,
                boo: null,
                str: null
            }
        };
    }
}