struct X {
    a: Int;
}
struct Y {
    x: X;
}
struct Z {
    y: Y;
}
contract Nester {
    val: Z;

    init() {
        self.val = Z{y:Y{x:X{a:42}}};
    }
}