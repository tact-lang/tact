struct A { b: B; }
struct B { c: C; }
struct C { d: D; }
struct D { val: Int; }

contract DeepChain {
    chain: A;
    
    init() {
        self.chain = A{ b: B{ c: C{ d: D{ val: 123 } } } };
    }
}