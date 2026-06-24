struct NestedFields {
    a: Int;
    b: Bool;
}

contract MixedPersistence {
    x: Int; 
    y: NestedFields;
    z: String;
    w: Slice;

    init() {
        self.x = 11;
        self.y = NestedFields{a:22, b:true};
        self.z = "hi";
        self.w = emptyCell().asSlice();
    }
}