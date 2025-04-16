// optional struct inside struct with optional fields
struct Inner {
    foo: Int?;
    bar: Bool?;
}

struct Outer {
    inr: Inner?;
}

contract Test {
    dat: Outer;

    init() {
        self.dat = Outer{
            inr: Inner{ foo:1, bar:null }
        };
    }
}