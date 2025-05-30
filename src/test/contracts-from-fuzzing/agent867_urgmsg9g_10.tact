struct S2 {
    nested: Int;
}

message(777) M2 {
    data: S2;
}

contract StoreMessage {
    m: M2;
    init() {
        self.m = M2{ data: S2{ nested: 55 } };
    }
}