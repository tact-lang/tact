// Contract with nested optionals in struct fields
struct Inner {
    a: Int?;
    b: Bool?;
}

struct Outer {
    x: Inner?;
    y: Int;
}

contract TestContract {
    field: Outer;

    init() {
        self.field = Outer{
            x: Inner{ a:null, b:true },
            y: 123
        };
    }
}