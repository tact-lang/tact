// edge: mutually nested struct chain (non-circular), optionals all null
struct A { next: B?; }
struct B { next: C?; }
struct C { next: D?; }
struct D { x:Int; }

contract TestContract {
    a: A;
    init() {
        self.a = A{next: null};
    }
}