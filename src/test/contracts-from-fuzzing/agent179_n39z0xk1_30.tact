struct HasBool {
    bval: Bool;
}

contract BoolStructField {
    s: HasBool;
    init() {
        self.s = HasBool{ bval: true };
    }
}