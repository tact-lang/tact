// mix of nested structs and flat fields
struct Foo {
    x: Int;
    y: Int?;
}

contract Combination {
    a: Int;
    b: Foo;
    c: Bool?;
    d: String?;

    init() {
        self.a = 1;
        self.b = Foo{ x:2,y:null };
        self.c = null;
        self.d = null;
    }
}