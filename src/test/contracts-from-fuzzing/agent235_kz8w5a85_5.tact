struct NestedOptStruct {
    foo: Int?;
    bar: Bool;
}

struct Container {
    element: NestedOptStruct?;
    num: Int;
}

contract ContainerContract {
    data: Container;

    init() {
        self.data = Container{
            element: NestedOptStruct{
                foo: null,
                bar: false
            },
            num: 123
        };
    }
}