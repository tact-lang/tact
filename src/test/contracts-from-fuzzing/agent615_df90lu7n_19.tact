struct ManyFields {
    i1: Int;          b1: Bool;          s1: String;          o1: Int?;
    i2: Int;          b2: Bool?;         s2: String?;         o2: Bool?;
    i3: Int;          b3: Bool;          s3: String;          o3: String?;
    i4: Int;          b4: Bool?;         s4: String?;         o4: Int?;
}

contract BigMixedStruct {
    val: ManyFields = ManyFields{
        i1: 1, b1: true, s1: "a", o1: null,
        i2: 2, b2: null, s2: null, o2: null,
        i3: 3, b3: false, s3: "b", o3: null,
        i4: 4, b4: null, s4: null, o4: null
    };

    init() { self.val = self.val; }
    receive() { self.val = self.val; }
}