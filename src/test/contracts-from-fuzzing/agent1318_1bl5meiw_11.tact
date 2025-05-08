struct Wrapper {
    a: Int;
    b: Int?;
}

contract OptionalStructField {
    w: Wrapper?;

    init() {
        self.w = Wrapper{a: 5, b: null};
    }
}