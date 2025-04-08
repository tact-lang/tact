struct Sub {
    foo: Int = 42;
    bar: Bool = true;
}

struct Container {
    s: Sub;
    name: String;
}

contract DefaultsStruct {
    data: Container;

    init() {
        self.data = Container{
            s: Sub{},
            name: "abc",
        };
    }
}