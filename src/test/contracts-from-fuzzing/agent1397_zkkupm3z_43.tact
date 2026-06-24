// chain of optional struct fields
struct A { next: B?; }
struct B { next: C?; }
struct C { val: Int; }

contract ChainOpt {
    root: A;

    init() {
        self.root = A{ next: null };
    }
}