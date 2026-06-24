contract NestedInit {
    x: Int;
    sub: SubData;

    init() {
        self.x = 5;
        self.sub = SubData { s: "abc", f: false };
    }
}

struct SubData {
    s: String;
    f: Bool;
}