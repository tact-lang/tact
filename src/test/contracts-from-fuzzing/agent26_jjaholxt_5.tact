struct A { val: Int; flag: Bool }
struct B { a: A? }
struct C { b: B }
struct D { c: C? }

contract DeepNestOpt {
    data: D;
    init() {
        self.data = D{
            c: null
        };
    }
}