struct Composed {
    s1: Int; s2: Bool; s3: Int?; s4: Bool?;
    s5: Int; s6: Bool; s7: Int?; s8: Bool?;
}

contract ComposedStruct {
    data: Composed;

    init() {
        self.data = Composed {
            s1: 1, s2: false, s3: null, s4: true,
            s5: 5, s6: true, s7: null, s8: false
        };
    }
}