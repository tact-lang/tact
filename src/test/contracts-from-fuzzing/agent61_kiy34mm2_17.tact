contract TestLogicalOperators {
    receive() {
        let a: Bool = true && false;   // expects false
        let b: Bool = true || false;   // expects true
        let c: Bool = !false && true;    // expects true
    }
}
