struct Composed {
    b: Bool;
    s: String;
    n: Int;
    opt: Bool?;
    txt: String?;
}

contract MixedTypes {
    data: Composed;

    init() {
        self.data = Composed{
            b: false,
            s: "hi",
            n: 88,
            opt: null,
            txt: null
        };
    }
}
