struct Layer1 {
    a: Int;
    b: Bool;
}

struct Layer2 {
    c: Layer1;
    d: String;
}

struct Layer3 {
    e: Layer2;
}

contract MultiLayered {
    nested: Layer3;

    init() {
        self.nested = Layer3{
            e: Layer2{ c: Layer1{ a:1, b:true }, d:"hi" }
        };
    }
}