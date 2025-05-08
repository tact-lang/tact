fun expensive(): Int {
    // This function is intentionally expensive; it produces a dump and returns 111
    dump(12345); // if this is called, we should see 12345 dumped
    return 111;
}

contract ShortCircuitTest {
    receive() {
        // Due to short-circuit evaluation, expensive() should not be called
        let b = false && (expensive() == 111);
        // If short-circuit is working correctly, b should be false and no dump from expensive() should occur
        dump(b); // expected output: false
        cashback(sender());
    }
    
    get fun getBool(): Bool {
        // Use short-circuit in a getter as well
        return false && (expensive() == 111);
    }
}

fun main() {}
