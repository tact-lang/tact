struct Third {
    a: Int;
    b: Int?;
}

struct Second {
    x: Third?;
    y: Bool;
}

struct First {
    p: Second?;
    q: String;
}

contract MixReqOptDeep {
    field: First;

    init() {
        self.field = First{
            p: null,
            q: "hello"
        };
    }
}