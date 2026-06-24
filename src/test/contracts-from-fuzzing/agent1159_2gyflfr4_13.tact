struct A {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    f6: Int;
    f7: Int;
    f8: Int;
}

contract TestContract(
    a: A,
    b: Int,
    c: Bool,
    d: String,
    e: Address,
    f: Slice,
    g: Cell,
) {
    receive() {
        let _ = self.a;
        let _ = self.b;
    }
}