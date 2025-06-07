contract TernaryTest {
    receive() {
        // Ternary operator is right-associative
        // Following expressions are equivalent:
        // false ? 1 : (true ? 2 : 3) and false ? 1 : true ? 2 : 3
        let a = false ? 1 : (true ? 2 : 3);  // expected 2
        dump(a);
        let b = false ? 1 : true ? 2 : 3;      // expected 2
        dump(b);
    }
}
