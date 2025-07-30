struct NestedWithDefaults {
    a: Int = 3;
    b: Bool = true;
    c: Sub?;
}

struct Sub {
    x: Int;
    y: Bool;
}

contract NestedDefaultsTest {
    foo: NestedWithDefaults;

    init() {
        self.foo = NestedWithDefaults{
            a: 5,
            b: false,
            c: Sub{x:8,y:true}
        };
    }
}