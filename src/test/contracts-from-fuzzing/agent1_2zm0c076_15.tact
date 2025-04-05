contract TestTernary {
    receive() {
        let a: Int = false ? 1 : (false ? 2 : 3);
        let b: Int = false ? 1 : false ? 2 : 3;
        let c: Int = true  ? (false ? 1 : 2) : 3;
    }
}
