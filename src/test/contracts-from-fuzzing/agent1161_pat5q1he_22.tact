struct MultiOptionals {
    foo: Int?;
    bar: Bool?;
    xyz: String?;
    cell: Cell?;
}

contract MultiOptContract {
    data: MultiOptionals?;

    init() {
        self.data = null;
    }
}