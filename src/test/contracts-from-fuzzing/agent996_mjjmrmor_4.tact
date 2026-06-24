struct IntsAndStrings {
    a: Int;
    b: String;
    c: Int;
    d: String;
    e: Int;
    f: String;
}

contract TestStorage {
    data: IntsAndStrings;

    init() {
        self.data = IntsAndStrings{
            a: 1,
            b: "first",
            c: 2,
            d: "second",
            e: 3,
            f: "third",
        };
    }
}