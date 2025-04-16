struct A {
    num: Int;
}

struct B {
    aObj: A?;
}

contract TestContract {
    field: B?;
    init() {
        self.field = null;
    }
}