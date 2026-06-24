struct Inner {
    p: Int?;
    q: String?;
}

struct Outer {
    a: Int?;
    b: Bool?;
    c: Inner?;
}

contract TestContract {
    complex: Outer;
    
    init() {
        self.complex = Outer{
            a: null,
            b: true,
            c: Inner{
                p: 123,
                q: null
            }
        };
    }
}