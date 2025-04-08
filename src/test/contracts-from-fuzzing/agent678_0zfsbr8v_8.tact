struct Nest1 {
    val1: Int;
    val2: String;
}

struct Nest2 {
    inside: Nest1;
    ok: Bool;
}

struct Top {
    n1: Nest1;
    n2: Nest2;
    text: String;
}

contract ComplexData {
    store: Top;

    init() {
        self.store = Top{
            n1: Nest1{val1:1,val2:"a"},
            n2: Nest2{inside:Nest1{val1:2,val2:"b"}, ok: true},
            text: "hello"
        };
    }
}
