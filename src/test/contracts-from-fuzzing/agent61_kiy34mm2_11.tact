contract TestTernaryExpr {
    receive() {
        // Ternary expression: condition ? expr1 : expr2
        let result: Int = (10 > 5) ? 100 : 200;
    }
}
