struct OptS {
    val: Int;
}

contract TestContract {
    s: OptS?;
    receive() { let _ = self.s; }
}