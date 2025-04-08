struct A { next: B?; } 
struct B { next: C?; }
struct C { next: D?; }
struct D { next: E?; }
struct E { x: Int = 1; }

contract LongOptChain {
    top: A;

    init() {
        self.top = A{ next: null };
    }
}