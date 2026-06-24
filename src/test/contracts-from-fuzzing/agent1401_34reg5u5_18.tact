struct First {
    a: Int;
    b: Bool;
}

struct Second {
    c: String;
    d: Address;
}

struct Third {
    e: First;
    f: Second;
}

contract CrossStructs {
    data: Third;

    init() {
        self.data = Third{
            e: First{a:1,b:true},
            f: Second{c:"hi",d:myAddress()}
        };
    }
}