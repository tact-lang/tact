struct A {
    x: Int?;
}

struct B {
    y: Int?;
}

struct Wrapper {
    a: A?;
    b: B?;
}

contract WrappedStructOptionals {
    val: Wrapper;
    init() {
        self.val = Wrapper{ a:null, b:null };
    }
}