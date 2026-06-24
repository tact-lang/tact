struct StringHolder {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
}

struct IntHolder {
    i1: Int;
    i2: Int;
    i3: Int;
    i4: Int;
    i5: Int;
}

struct MixedFields {
    a: IntHolder;
    b: StringHolder;
    flag: Bool;
    optStr: String?;
    optInt: Int?;
}

contract MixedNestedStructContract {
    mixed: MixedFields;

    init() {
        self.mixed = MixedFields{
            a: IntHolder{ i1: 1, i2: 2, i3: 3, i4: 4, i5: 5 },
            b: StringHolder{ s1: "a", s2: "b", s3: "c", s4: "d", s5: "e" },
            flag: false,
            optStr: "opt",
            optInt: null,
        };
    }
}