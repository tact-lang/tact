// contract parameters with nested struct
struct S {
    a: Int;
    b: String;
}

contract TestContract(
    param: S
) {
    receive() {
        dump(self.param.a);
    }
}