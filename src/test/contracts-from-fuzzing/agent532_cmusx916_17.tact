struct ManyStrings {
    a: String;
    b: String;
    c: String;
    d: String;
}

contract StringContract {
    field: ManyStrings;

    init() {
        self.field = ManyStrings{
            a:"one", b:"two", c:"three", d:"four"
        };
    }
}