contract TestTernary {
    receive() {
        // Ternary expression: if 2 + 2 == 4 then 10 else 20
        let a: Int = 2 + 2 == 4 ? 10 : 20;
        a;
    }
}
