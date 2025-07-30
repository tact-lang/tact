struct A { x: Int; }
struct B { y: Int; }
struct Container {
    a: A?;
    b: B?;
}

contract DeepOptStruct {
    data: Container;

    init() {
        self.data = Container{
            a: null,
            b: null,
        };
    }
}