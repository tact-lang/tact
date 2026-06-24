struct LargeStrings {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
}

contract ManyStrings {
    data: LargeStrings;

    init() {
        self.data = LargeStrings{
            a: "alpha",
            b: "bravo",
            c: "charlie",
            d: "delta",
            e: "echo"
        };
    }
}