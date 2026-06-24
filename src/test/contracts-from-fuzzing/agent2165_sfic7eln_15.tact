struct Defaults {
    foo: Int = 123;
    bar: String = "hello";
    baz: Bool = true;
}

struct Container {
    one: Defaults;
    two: Defaults;
}

contract WithDefaults {
    data: Container;

    init() {
        self.data = Container{
            one: Defaults{},
            two: Defaults{}
        };
    }
}