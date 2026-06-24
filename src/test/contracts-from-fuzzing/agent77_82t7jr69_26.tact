message(5) M1 {}
message(6) M2 {}

struct Wrapper {
    m1: M1;
    m2: M2;
}

contract TestContract {
    w: Wrapper = Wrapper{m1: M1{}, m2: M2{}};
    init() {}
}