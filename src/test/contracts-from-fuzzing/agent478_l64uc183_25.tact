struct MixedInits {
    a: Int;
    b: Bool;
    c: Bool?;
    d: Int?;
    e: String;
    f: String?;
}

contract MixedFields {
    val: MixedInits;
    init() {
        self.val = MixedInits{
            a: 0, b: true, c: null, d: null, e: "", f: null
        };
    }
}