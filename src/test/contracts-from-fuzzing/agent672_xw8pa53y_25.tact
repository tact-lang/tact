struct A {
    f1: Int;
}

struct B {
    f2: A;
    opt: Int?;
}

contract CombineStructsOptionals {
    data: B;
    init() {
        self.data = B{ f2: A{ f1: 12 }, opt: null };
    }
}
