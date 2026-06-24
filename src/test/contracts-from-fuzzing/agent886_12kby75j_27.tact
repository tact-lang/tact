struct Sub {
    field: String;
}

struct Container {
    x: Int;
    data: Slice as remaining;
}

contract TestContract {
    cont: Container;

    init() {
        self.cont = Container{
            x: 123,
            data: "hello".asComment().asSlice()
        };
    }
}