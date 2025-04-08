message(1) M1 { a: Int }

message(2) M2 { b: Int }

message(3) M3 { c: Int }

struct HasManyMsgs {
    m1: M1;
    m2: M2;
    m3: M3;
}

contract ManyMsgsParam(
    x: HasManyMsgs
) {}