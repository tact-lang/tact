struct Container {
    id: Int;
    blob: Cell as remaining;
}

contract TestContract {
    big: Container;

    init() {
        self.big = Container{
            id: 5,
            blob: emptyCell(),
        };
    }
}