trait T1 {
    abstract const X: Int;
}

trait T2 {
    const X: Int = 5;
}

contract C() with T1, T2 {
    // Must override X because of T1 requirement
    override const X: Int = 10;

    receive() {
        dump(self.X);
    }
}
