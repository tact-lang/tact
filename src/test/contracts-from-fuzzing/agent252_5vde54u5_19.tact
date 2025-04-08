struct Nested {
    x: Int;
    y: Int?;
}

contract OptionalStructField {
    main: Nested?;

    init() {
        self.main = Nested{x:5,y:null};
    }
}