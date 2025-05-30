contract TestAugAssign {
    receive() {
        let a: Int = 10;
        a += 5;
        let b: Int = a;
    }
}
