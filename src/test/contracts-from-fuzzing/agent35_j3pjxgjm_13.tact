//// Additional Fuzz-testing Cases for Tact (Continued)

// Test 12: Ternary Operator Precedence
// Expected:
//   false ? 1 : false ? 2 : 3  evaluates as false ? 1 : (false ? 2 : 3) = 3
//   false ? 1 : true ? 2 : 3   evaluates as false ? 1 : (true ? 2 : 3)  = 2
contract TestTernary {
    fun test() {
        let v1: Int = false ? 1 : false ? 2 : 3;
        let v2: Int = false ? 1 : true ? 2 : 3;
        dump(v1); // expected output: 3
        dump(v2); // expected output: 2
    }
    receive() { self.test(); }
}

// Test 13: Destructuring Assignment with Structs
struct Pair { first: Int; second: Int; }
contract TestDestructuring {
    fun test() {
        let p: Pair = Pair { first: 999, second: 888 };
        let Pair { first, .. } = p;
        dump(first); // expected: 999
        let Pair { second: s, .. } = p;
        dump(s);     // expected: 888
    }
    receive() { self.test(); }
}

// Test 14: Compile-Time Functions: crc32 and ton
contract TestCompileTime {
    fun test() {
        // Compute crc32 of "hello" at compile time
        let crc: Int = crc32("hello");
        dump(crc);
        // Convert string to Toncoin value: 1 Toncoin = 1000000000 nanoToncoin
        let tonVal: Int = ton("1");
        dump(tonVal);
    }
    receive() { self.test(); }
}

// End of Additional Fuzz-testing Cases
