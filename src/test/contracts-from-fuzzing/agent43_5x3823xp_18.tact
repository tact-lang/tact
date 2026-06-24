struct MultiLayer {
    a: Int;
    b: Int?;
}

contract LayeredFields {
    x: Int;
    y: MultiLayer;
    z: Int?;

    init() {
        self.x = 1;
        self.y = MultiLayer{a:2, b:null};
        self.z = null;
    }
}
