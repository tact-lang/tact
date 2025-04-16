struct WideString {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
}

contract WideStringStorage {
    val: WideString = WideString{
        a: "a",
        b: "bb",
        c: "ccc",
        d: "dddd",
        e: "eeeee"
    };

    init() {
        self.val = WideString{
            a: "1",
            b: "22",
            c: "333",
            d: "4444",
            e: "55555"
        };
    }
}