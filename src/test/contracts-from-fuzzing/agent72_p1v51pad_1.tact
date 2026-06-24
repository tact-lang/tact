contract TestContract {
    intVar: Int = 7;

    receive() {
        let _ = self.intVar;
    }
}