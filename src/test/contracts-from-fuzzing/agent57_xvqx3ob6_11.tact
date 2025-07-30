contract TestTernary {
    receive() {
        let a: Int = true ? 1 : 2;
        let b: Int = false ? 1 : (false ? 2 : 3);
        let c: Int = false ? 1 : false ? 2 : 3; // testing right associativity of the ternary operator
    }
}
