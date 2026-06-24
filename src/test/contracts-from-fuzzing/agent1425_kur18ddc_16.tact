struct D { flag: Bool?; note: String; }
struct C { d: D; count: Int; }
struct B { c: C?; label: String; }
struct A { b: B; done: Bool; }

contract NestedContract {
    data: A;

    init() {
        self.data = A{
            b: B{
                c: null,
                label: "Level B"
            },
            done: false
        };
    }

    receive() {}
}