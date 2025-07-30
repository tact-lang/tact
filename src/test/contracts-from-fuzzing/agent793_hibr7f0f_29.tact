struct Reorder {
    x: Int;
    y: Bool;
    z: String;
}

contract StructOrder {
    r1: Reorder;
    r2: Reorder;
    init() {
        self.r1 = Reorder{ x: 4, y: true, z: "a" };
        self.r2 = Reorder{ x: 5, y: false, z: "b" };
    }
}