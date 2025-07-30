struct Crazy {
    a: Bool?;
    b: Int?;
    c: String?;
    d: Bool;
    e: Int;
    f: String;
}

contract AllOptionals {
    data: Crazy;

    init() {
        self.data = Crazy{
            a: null, b: 1, c: null, d: true, e: 5, f: "hi"
        };
    }
}