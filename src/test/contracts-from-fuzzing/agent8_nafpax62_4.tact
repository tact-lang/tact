trait T1 {
    const X: Int = 1;
}

trait T2 {
    const X: Int = 2;
}

contract C() with T1, T2 {
    override const X: Int = 42;
    receive() {
         let a = self.X;
    }
}
