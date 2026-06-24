struct X {
    a: Int as int64 = 7;
    b: Int? as uint4 = null;
}
struct Y {
    z: X = X{};
}
contract TestContract {
    foo: Y;
    init() {
        self.foo = Y{};
    }
}