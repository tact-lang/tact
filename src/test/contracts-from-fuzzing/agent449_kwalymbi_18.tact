// Very large struct with many fields
struct Giant {
    i1: Int; i2: Int; i3: Int; i4: Int; i5: Int;
    s1: String; s2: String; s3: String; s4: String;
    b1: Bool; b2: Bool; b3: Bool; b4: Bool;
    o1: Int?; o2: String?; o3: Bool?;
}

contract TestContract {
    big: Giant;

    init() {
        self.big = Giant{
            i1: 1, i2: 2, i3:3, i4:4, i5:5,
            s1: "a", s2: "b", s3: "c", s4: "d",
            b1: true, b2: false, b3: true, b4: false,
            o1: null, o2: null, o3: null,
        };
    }
}
