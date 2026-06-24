struct A { x: Int; }
struct B { y: Bool; }

contract DeepChain {
    a: A;
    b: B;
    aOpt: A?;
    bOpt: B?;
    init() {
        self.a = A{x:1};
        self.b = B{y:true};
        self.aOpt = null;
        self.bOpt = null;
    }
}
