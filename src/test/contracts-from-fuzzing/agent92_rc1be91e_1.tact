contract LetTest {
    receive() {
        let explicit: Int = 10;  // variable with explicit type
        let inferred = 20;       // variable with inferred type Int
        dump(explicit + inferred);
    }
}
