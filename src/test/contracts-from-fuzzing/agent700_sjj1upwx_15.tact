struct A { x:Int }
struct B { y:Int }
struct C { z:Int }
struct ABC {
    a: A;
    b: B;
    c: C;
}

contract MultiNested {
    m: ABC;
    init() {
        self.m = ABC{ a:A{x:1}, b:B{y:2}, c:C{z:3} };
    }
}