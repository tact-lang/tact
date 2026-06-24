struct NestedOptionals {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract TestContract {
    nopt: NestedOptionals?;

    init() {
        self.nopt = null;
    }
}