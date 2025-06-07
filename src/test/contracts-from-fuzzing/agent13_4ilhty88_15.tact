contract TestTernary {
    receive() {
        let a: Int = false ? 1 : false ? 2 : 3;  // expecting 3
        dump(a);
        let b: Int = true ? 1 : false ? 2 : 3;   // expecting 1
        dump(b);
        let c: Int = false ? (false ? 1 : 2) : 3;  // expecting 3
        dump(c);
    }
}
