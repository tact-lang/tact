contract TestLogicalOperators {
    receive() {
         let a: Bool = true && false;
         let b: Bool = true || false;
         let c: Bool = !(a || b);
    }
}
