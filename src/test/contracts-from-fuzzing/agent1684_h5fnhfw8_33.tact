const X: Int = 42;

message(1) MsgInner {
    foo: Int = X;
}

struct SInner {
    bar: Int = X;
    msg: MsgInner? = null;
}

struct SOuter {
    inn: SInner? = null;
}

contract ComplexPersistence {
    data: SOuter = SOuter{ inn: null };
}