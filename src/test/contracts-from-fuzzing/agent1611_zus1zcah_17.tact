struct NestedDefaults {
    foo: Foo;
}

struct Foo {
    id: Int = 1;
    flag: Bool = true;
    str: String = "x";
}

contract NestedDefTest {
    data: NestedDefaults;
    init() {
        self.data = NestedDefaults{
            foo: Foo{}
        };
    }
}