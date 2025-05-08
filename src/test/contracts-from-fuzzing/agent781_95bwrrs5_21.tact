struct Next {
    a: Int;
    b: Int;
}

struct Container {
    flag: Bool;
    vals: Next;
}

contract TestContract {
    c: Container;

    init() {
        self.c = Container{
            flag: true,
            vals: Next{
                a: 5,
                b: 10
            }
        };
    }
}