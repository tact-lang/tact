struct Primitives {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
}

contract InitAllPrimitives {
    x: Primitives;

    init() {
        self.x = Primitives{ a:5, b:true, c:"hello", d:myAddress() };
    }
}