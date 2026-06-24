struct PrimitiveMixed {
    x: Int;
    y: Bool;
    z: String;
}

contract MultipleAssign {
    data1: PrimitiveMixed;
    data2: PrimitiveMixed;

    init() {
        self.data1 = PrimitiveMixed{ x: 1, y: false, z: "first" };
        self.data2 = PrimitiveMixed{ x: 2, y: true, z: "second" };
    }
}