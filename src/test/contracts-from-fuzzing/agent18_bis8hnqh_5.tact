contract BlockTest {
    receive() {
        // Block with multiple statements; last semicolon omitted
        {
            let a = 1;
            let b = 2
        }
        dump("Block complete");
    }
}
