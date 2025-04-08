struct A { x: Int }
struct B { y: Int }

struct C {
    a: A?;
    b: B?;
}

contract OptMany {
    val: C;

    init() {
        self.val = C{
            a: null,
            b: B { y: 55 }
        };
    }
}