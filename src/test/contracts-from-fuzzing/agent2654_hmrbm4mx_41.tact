struct A { x: Int; } 
struct B { a: A; } 
struct C { b: B; }

contract NestedInitChains {
    c: C;

    init() {
        let v = A{x:5};
        let u = B{a:v};
        self.c = C{b:u};
    }
}