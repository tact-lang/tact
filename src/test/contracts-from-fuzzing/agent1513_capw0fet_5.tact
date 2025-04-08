struct A {
    x: Int;
}

struct B {
    y: Int;
    z: A;
}

struct C {
    flag: Bool;
    content: B;
}

contract DeepChain {
    data: C;
    
    init() {
        self.data = C{
            flag: true,
            content: B{
                y: 42,
                z: A{ x: 100 }
            }
        };
    }
}