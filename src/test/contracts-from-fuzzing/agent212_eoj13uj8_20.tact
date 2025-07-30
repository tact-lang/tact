message(1) Msg1 { m: Int; }
message(2) Msg2 { n: String; }

struct X {
    x1: Int;
    x2: String?;
}
struct Y {
    y1: X;
    y2: Bool;
    y3: Msg1?;
}
struct Z {
    z1: Y?;
    z2: Msg2;
}

contract TestContract {
    field1: X = X{ x1: 1, x2: null };
    field2: Y = Y{ y1: X{ x1: 2, x2: "hi" }, y2: true, y3: Msg1{ m: 5 } };
    field3: Z = Z{ z1: null, z2: Msg2{ n: "yo" } };
    init() {}
}