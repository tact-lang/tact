struct A {
    x: Int?;
}

struct B {
    a: A?;
}

contract DeepOpt {
    b: B?;
    
    init() {
        self.b = null;
    }
    
    receive() {}
}