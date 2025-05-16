struct BoolIntString {
    b: Bool;
    i: Int;
    s: String;
}

contract OrderedFields {
    val: BoolIntString;

    init() {
        self.val = BoolIntString{
            b: true,
            i: 100,
            s: "text"
        };
    }
}
