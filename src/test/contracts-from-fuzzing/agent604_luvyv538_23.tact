struct Inner1 {
    a: Int;
}
struct Inner2 {
    b: Bool?;
}

struct BothTogether {
    s1: Inner1;
    s2: Inner2;
}

contract BothStructsAcc {
    val: BothTogether;

    init() {
        self.val = BothTogether{ s1: Inner1{ a: 7 }, s2: Inner2{ b: null } };
    }
}