struct A {
    i: Int;
}

struct B {
    optA: A?;
    flag: Bool;
}

contract TestContract {
    value: B;
    
    init() {
        self.value = B{
            optA: null,
            flag: true,
        };
    }
}