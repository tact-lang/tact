struct NestedOptional {
    x: Int?;
    y: Bool?;
}

contract OptionalDeeper {
    nest1: NestedOptional;
    nest2: NestedOptional;

    init() {
        self.nest1 = NestedOptional{x: null, y: true};
        self.nest2 = NestedOptional{x: 5, y: null};
    }
}