struct Partial {
    x: Int;
    y: Int;
    z: Int?;
}

contract PartialStruct {
    part: Partial;

    init() {
        self.part = Partial{ x: 1, y: 2, z: null };
    }
}