struct Sub1 {
    flag1: Bool;
}

struct Sub2 {
    flag2: Bool = true;
    optVal: Int?;
}

contract DefaultOptionals {
    sub1: Sub1;
    sub2: Sub2;
    val: Int = 5;

    init() {
        self.sub1 = Sub1{ flag1: false };
        self.sub2 = Sub2{ optVal: null };
        self.val = 42;
    }
}