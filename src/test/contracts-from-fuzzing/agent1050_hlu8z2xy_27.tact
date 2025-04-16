struct IntsAndStrings {
    a: Int;
    b: String;
    c: Int;
    d: String;
    e: Int;
    f: String;
}

contract InterleavedTypes {
    val: IntsAndStrings;

    init() {
        self.val = IntsAndStrings{
            a:1, b:"b", c:3, d:"d", e:5, f:"f"
        };
    }
}
