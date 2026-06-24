struct A { x: Int }
struct B { y: Int }
struct C { a: A; b: B }

contract Combine {
    val: C;

    init() {
        self.val = C{
            a: A{x:1},
            b: B{y:2}
        };
    }
}