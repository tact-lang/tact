struct Deep {
    a: Int;
    b: Bool?;
}

contract OptionalTopNested {
    cmp: Deep?;

    init() {
        self.cmp = Deep{a:5,b:null};
    }
}
