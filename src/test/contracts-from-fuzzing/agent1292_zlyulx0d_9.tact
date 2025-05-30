struct Wide {
    i1: Int; i2: Int; i3: Int; i4: Int; i5: Int;
    s1: String; s2: String;
    b1: Bool; b2: Bool;
    opt1: Int?; opt2: String?; opt3: Bool?;
}

contract WideFields {
    data: Wide;

    init() {
        self.data = Wide{
            i1: 1, i2: 2, i3: 3, i4: 4, i5: 5,
            s1: "a", s2: "b",
            b1: true, b2: false,
            opt1: null, opt2: null, opt3: null,
        };
    }
}