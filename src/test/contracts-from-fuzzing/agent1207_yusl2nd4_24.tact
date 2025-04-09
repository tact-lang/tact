struct Trio {
    one: Int;
    two: String;
    three: Bool;
}

contract TrioFields {
    t: Trio;

    init() {
        self.t = Trio{
            one: 4,
            two: "def",
            three: true,
        };
    }
}