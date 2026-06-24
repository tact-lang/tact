struct ManyStrings {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
    f: String;
}

contract TestContract {
    data: ManyStrings;

    init() {
        self.data = ManyStrings{
            a: "a",
            b: "b",
            c: "c",
            d: "d",
            e: "e",
            f: "f"
        };
    }

    receive() {
        let _ = self.data.c;
    }
}