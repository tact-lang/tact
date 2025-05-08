/* Additional Comprehensive Fuzz-Testing of Tact Language Features
   Revised to remove unsupported mutable declaration (var) in favor of reassignable variables using let.
*/

// 17. CompileTimeTest
contract CompileTimeTest {
    fun test() {
        // ton("1") returns 10^9 nanoToncoins
        let nanoTon: Int = ton("1");
        dump(nanoTon); // Expected: 1000000000

        let asciiVal: Int = ascii("⚡");
        dump(asciiVal); // Expected: compile-time computed value

        let crcVal: Int = crc32("Hello, Tact!");
        dump(crcVal); // Expected: compile-time computed CRC32 value

        // Use rawSlice to embed a hex-encoded slice. Here, "DEADBEEF" in hex.
        let s: Slice = rawSlice("DEADBEEF");
        dump(s.bits()); // Dumps number of bits in the raw slice
    }
    receive() {
        self.test();
    }
}

// 18. MapForeachTest
contract MapForeachTest {
    fun test() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 10);
        m.set(2, 20);
        
        // Sum over keys and values
        let sum: Int = 0;
        // Since assignment is allowed, we can reassign to sum
        foreach (k, v in m) {
            sum = sum + k + v;
        }
        dump(sum); // Expected: (1+10) + (2+20) = 33
    }
    receive() {
        self.test();
    }
}

// 19. LiteralsTest
contract LiteralsTest {
    fun test() {
        dump(42);          // Decimal: 42
        dump(0x2A);        // Hexadecimal: 42
        dump(0o52);        // Octal: 42
        dump(0b101010);    // Binary: 42
        dump("Line\nBreak"); // String with newline escape
    }
    receive() {
        self.test();
    }
}

// 20. ControlFlowTest
contract ControlFlowTest {
    fun test() {
        let x: Int = 10;
        let y: Int = x; // Declare y as reassignable
        // Reassign y in a loop
        while (y > 0) {
            y = y - 2;
        }
        dump(y); // Expected: 0 (10 - 2*5 = 0)
        
        if (y == 0) {
            dump(100);
        } else {
            dump(200);
        }
        
        repeat (3) {
            dump(1);
        }
    }
    receive() {
        self.test();
    }
}

// End of additional fuzz-testing suite
