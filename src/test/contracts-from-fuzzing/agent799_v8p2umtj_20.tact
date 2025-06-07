struct A { x: Int }
struct B { y: Int }
struct C { a: A; b: B }

contract MultipleStructsInOne {
    data: C;
    val: Int;

    init() {
        self.data = C{
            a: A{x:7},
            b: B{y:9}
        };
        self.val = 42;
    }
}