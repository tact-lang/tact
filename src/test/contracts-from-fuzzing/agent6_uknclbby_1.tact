contract DebugTest {
    // Simple test: dump Int and Bool
    receive("debug") {
        dump(42);
        dump(true);
        dump(false);
        cashback(sender());
    }
}
