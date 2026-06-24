struct Sub1 {
    flag: Bool;
}

struct Sub2 {
    inner: Sub1;
}

struct Sub3 {
    inner: Sub2;
}

struct Sub4 {
    inner: Sub3;
}

struct Sub5 {
    inner: Sub4;
}

contract Nested5 {
    field: Sub5;

    init() {
        self.field = Sub5{
            inner: Sub4{
                inner: Sub3{
                    inner: Sub2{
                        inner: Sub1{ flag: true }
                    }
                }
            }
        };
    }
}