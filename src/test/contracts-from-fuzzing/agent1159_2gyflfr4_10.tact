struct Inner {
    val: Int;
}

struct Outer {
    nested: Inner;
}

contract TestContract(
    param: Outer,
) {
    receive() {
        // Dummy usage to ensure compilation
        let _ = self.param;
    }
}