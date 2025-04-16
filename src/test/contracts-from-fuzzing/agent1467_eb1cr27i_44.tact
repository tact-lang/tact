struct First {
    a: Int;
    b: Bool;
}

struct Second {
    c: Int?;
    d: String;
}

struct Compose {
    x: First;
    y: Second;
}

contract ComposeContract {
    data: Compose;
    init() {
        self.data = Compose{
            x: First{a:1,b:true},
            y: Second{c:null,d:"ok"}
        };
    }
}