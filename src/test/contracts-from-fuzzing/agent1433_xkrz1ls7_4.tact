struct NestedOptional {
    x: Int?;
    y: Bool?;
    z: Cell?;
}

contract TestContract {
    data: NestedOptional;
    init() {
        self.data = NestedOptional{
            x: null,
            y: true,
            z: emptyCell(),
        };
    }
}