struct Container {
    a: Int;
    b: Slice as remaining;
}

contract TestContract {
    cont: Container;

    init() {
        self.cont = Container{
            a: 10,
            b: emptyCell().asSlice(),
        };
    }
}