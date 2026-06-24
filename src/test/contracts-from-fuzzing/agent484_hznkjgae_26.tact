struct Inner1 { 
    a: Int?;
    b: Bool?;
}

struct Inner2 {
    c: Inner1?;
    d: Inner1?;
}

struct Outer {
    e: Inner2?;
}

contract TestContract {
    val: Outer?;

    init() {
        self.val = Outer{
            e: Inner2{
                c: Inner1{ a: null, b: null },
                d: null,
            }
        };
    }
}