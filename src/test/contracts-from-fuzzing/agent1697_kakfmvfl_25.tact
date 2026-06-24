struct A { f1: Int } 
struct B { a: A } 
struct C { b: B } 
struct D { c: C } 
struct E { d: D } 

contract NestedChain {
    chain: E;

    init() {
        self.chain = E{d: D{c: C{b: B{a: A{f1: 123}}}}};
    }
}