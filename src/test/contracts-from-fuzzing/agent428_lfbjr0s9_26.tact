// Many nested, optional, and deeply combined persistent fields
struct A {
    value: Int?;
}

struct B {
    inner: A?;
    flag: Bool;
}

struct C {
    innerB: B?;
    text: String?;
}

contract TestContract {
    copt: C?;
    str: String?;
    yes: Bool;

    init() {
        self.copt = null;
        self.str = null;
        self.yes = true;
    }
}