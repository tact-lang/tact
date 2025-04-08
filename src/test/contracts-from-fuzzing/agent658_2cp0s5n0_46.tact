struct A { f: Int }
struct B { g: Bool }
struct Container {
    a: A;
    b: B;
    some: Int;
}

contract MultiNested {
    val: Container;

    init() {
        self.val = Container{
            a: A{f:1},
            b: B{g:true},
            some: 42
        };
    }
}