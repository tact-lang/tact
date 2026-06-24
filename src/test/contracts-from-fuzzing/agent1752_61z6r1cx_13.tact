message(1) Msg1 {}
message(2) Msg2 {}
message(3) Msg3 {}

struct Wrapped {
    f1: Int;
    f2: Bool;
    s1: Msg1;
    s2: Msg2;
    s3: Msg3;
}

contract CompoundWrapped {
    x: Wrapped;

    init() {
        self.x = Wrapped{ f1: 1, f2: false, s1: Msg1{}, s2: Msg2{}, s3: Msg3{} };
    }
}