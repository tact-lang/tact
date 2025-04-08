struct A {
    i: Int;
}

struct B {
    ai: A?;
    bi: A?;
}

contract MultipleOptionalStructs {
    data: B;
    init() {
        self.data = B{ ai: null, bi: null };
    }
}
