struct A { a: Int }
struct B { b: Int }
struct C { c: Int }

struct Container {
    a: A?;
    b: B?;
    c: C?;
}

contract OptionContainers {
    val: Container;

    init() {
        self.val = Container{
            a: A{a:1},
            b: null,
            c: C{c:3}
        };
    }
}