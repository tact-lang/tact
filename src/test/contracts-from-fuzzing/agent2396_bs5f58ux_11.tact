struct Mixed {
    i: Int;
    b: Bool;
    s: String;
    o: Int?;
    p: Bool?;
    q: String?;
}

contract MixedFields {
    val: Mixed;

    init() {
        self.val = Mixed{
            i: 1,
            b: false,
            s: "hi",
            o: null,
            p: null,
            q: null
        };
    }
}