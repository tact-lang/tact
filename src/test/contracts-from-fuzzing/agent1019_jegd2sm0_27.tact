message Msg1 {
    foo: Int;
    bar: Bool;
}

contract TestContract(
    m: Msg1,
) {
    receive() {
        dump(self.m.foo);
    }
}