struct Mid {
    a: Int;
    b: Bool;
}

struct Outer {
    opt: Mid?;
    req: Mid;
}

contract Test14 {
    data: Outer;

    init() {
        self.data = Outer{
            opt: Mid{a:1, b:false},
            req: Mid{a:2, b:true}
        };
    }
}