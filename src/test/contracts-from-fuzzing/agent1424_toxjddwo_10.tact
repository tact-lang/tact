struct Layer1 {
    a: Int;
    b: String;
}

struct Layer2 {
    c: Layer1;
    d: Bool;
}

struct Layer3 {
    e: Layer2;
    f: Int?;
}

contract FlatteningTest {
    nested: Layer3;

    init() {
        self.nested = Layer3{
            e: Layer2{
                c: Layer1{a:10,b:"hello"},
                d: false
            },
            f: null
        };
    }
}