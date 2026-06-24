struct A { 
    val: Int; 
}

struct B {
    a: A;
    opt_a: A?;
}

contract NestBoth {
    b: B;
    
    init() {
        self.b = B {
            a: A { val: 123 },
            opt_a: null
        };
    }
}