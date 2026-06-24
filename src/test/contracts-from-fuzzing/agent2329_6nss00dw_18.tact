struct SubStruct {
    x: Int;
    y: Bool;
}

contract OptStructField {
    maybe: SubStruct?;

    init() {
        self.maybe = SubStruct{ x: 100, y: false };
    }
}
