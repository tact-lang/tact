struct NestedStrings {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
}

contract Test {
    s: NestedStrings;

    init() {
        self.s = NestedStrings{
            a:"a", b:"b", c:"c", d:"d", e:"e"
        };
    }
}