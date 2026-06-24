contract TestTernaryExpr {
    receive() {
         let a: Bool = true;
         let x: Int = a ? 10 : 20;
    }
}
