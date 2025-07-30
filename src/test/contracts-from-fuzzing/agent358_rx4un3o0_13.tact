struct First {
    x: Int;
    y: Bool;
}

struct Second {
    s: First;
    z: String;
}

struct Third {
    f: Second;
    q: Int;
}

contract CrossTypeStor {
    storage: Third;

    init() {
        self.storage = Third{
            f: Second{
                s: First{x:1, y:true},
                z:"hi"
            },
            q: 999
        };
    }
}
