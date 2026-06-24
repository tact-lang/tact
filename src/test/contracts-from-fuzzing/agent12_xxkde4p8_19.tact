struct TernaryTest {
    a: Int?;
}

contract TestTernary {
    receive() {
        // Optional value initialized to null
        let opt: Int? = null;
        // Using ternary operator to check optional value
        let result: Int = (opt != null) ? (opt!!) : 100;
        dump(result); // Expect to dump 100
    }
}
