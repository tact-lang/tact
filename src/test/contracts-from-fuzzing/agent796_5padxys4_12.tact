struct Parametrized {
    x: Int;
    y: Int;
    z: Int?;
}

contract Test {
    param: Parametrized;
    init() {
        self.param = Parametrized{ x: 1, y: 2, z: null };
    }
}