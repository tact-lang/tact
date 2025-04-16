struct Repeated {
    v: Int;
}

struct Container {
    r1: Repeated;
    r2: Repeated;
    r3: Repeated;
}

contract TestContract {
    cont: Container;
    
    init() {
        self.cont = Container{
            r1: Repeated{v:1},
            r2: Repeated{v:2},
            r3: Repeated{v:3}
        };
    }
}