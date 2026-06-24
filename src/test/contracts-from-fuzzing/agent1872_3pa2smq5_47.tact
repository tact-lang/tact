message(101) M1 {
    a: Int;
}

message(102) M2 {
    m: M1;
}

contract PersistNestedMsg {
    m: M2;
    init() {
        self.m = M2{ m: M1{ a: 99 } };
    }
}