// contract parameters with optional struct parameter
struct S {
    v: Int;
}

contract TestContract(
    param: S?
) {
    receive() {
        dump(self.param == null);
    }
}