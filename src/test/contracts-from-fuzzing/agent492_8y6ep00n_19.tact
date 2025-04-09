struct A { x: Int }
struct B { y: Bool }
struct C {
    a: A;
    b: B;
}
contract Foo {
    data: C;
    init() {
        self.data = C{
            a: A{x:5},
            b: B{y:true}
        };
    }
}