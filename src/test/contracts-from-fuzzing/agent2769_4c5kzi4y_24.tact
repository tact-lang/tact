struct First {
    a: Int;
    b: Bool;
}

struct Second {
    c: String;
    d: Int?;
}

contract DiffStructs {
    one: First;
    two: Second;

    init() {
        self.one = First{a:0,b:true};
        self.two = Second{c:"hi",d:null};
    }
}