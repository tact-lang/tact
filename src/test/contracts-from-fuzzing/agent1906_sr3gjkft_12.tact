struct Sparse {
    id: Int;           // no default
    flag: Bool = true; // default
    note: String;      // no default
    desc: String = ""; // default
}

contract MixDefaults {
    data: Sparse;

    init() {
        self.data = Sparse{
            id: 42,
            note: "abc"
        };
    }
}
