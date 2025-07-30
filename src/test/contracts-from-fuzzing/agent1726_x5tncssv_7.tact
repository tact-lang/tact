struct A { x: Int; }
struct B { a: A; }
struct C { b: B; }
struct D { c: C; }

contract Nest4 {
    deep: D;

    init() {
        self.deep = D{
            c: C{ b: B{ a: A{ x: 777 } } }
        };
    }
}