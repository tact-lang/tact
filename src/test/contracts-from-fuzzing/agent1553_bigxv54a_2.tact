struct Innermost {
    value: Int?;
}

struct Inner {
    nested: Innermost?;
}

struct Outer {
    sub: Inner?;
}

contract TestContract {
    data: Outer;
    
    init() {
        self.data = Outer{sub: null};
    }
}