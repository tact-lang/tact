// Deep optional in optional struct nested chain
struct A {
    val: Int?;
}

struct B {
    a: A?;
}

contract OptOptOpt {
    root: B?;

    init() {
        self.root = B{
            a: A{
                val: null
            }
        };
    }
}