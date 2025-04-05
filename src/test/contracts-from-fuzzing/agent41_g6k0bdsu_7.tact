contract TestTernary {
    receive() {
        // Ternary operator: if 2+2==4 then "yes" else "no"
        let result: String = (2 + 2 == 4) ? "yes" : "no";
        dump(result);
    }
}
