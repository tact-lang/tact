struct ManyStrings {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
}

contract TestManyStrings {
    data: ManyStrings;
    init() {
        self.data = ManyStrings{
            a:"one", b:"two", c:"three", d:"four", e:"five"
        };
    }
}