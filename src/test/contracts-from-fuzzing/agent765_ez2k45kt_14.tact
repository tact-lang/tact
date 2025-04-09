struct Variant {
    a: Int?;
    b: Int?;
    c: Int;
}

contract TestContract {
    one: Variant;
    two: Variant;

    init() {
        self.one = Variant{ a:1, b:null, c:5 };
        self.two = Variant{ a:null, b:2, c:6 };
    }
}