struct NestedOptional {
    x: Int?;
    y: Bool?;
    z: Address?;
}

contract TestContract {
    s: NestedOptional;

    init() {
        self.s = NestedOptional{
            x: null,
            y: true,
            z: null,
        };
    }
}