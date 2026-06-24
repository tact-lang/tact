contract TestTonValue {
    // Test ton() compile-time function works as documented
    a: Int = ton("1");

    receive() {
        self.a;
    }
}

contract TestFromBase64Identity {
    // Test that fromBase64() on a String vs on its asSlice() result are equivalent
    receive() {
        let s: String = "SGVyZSdzIEpvaG5ueSE=";
        let slice1: Slice = s.fromBase64();
        let slice2: Slice = s.asSlice().fromBase64();
        if (slice1.asString() == slice2.asString()) {
            slice1.asString();
        } else {
            "Mismatch";
        }
    }
}

contract TestRawSliceBitPadded {
    // Test rawSlice with and without bit-padding.
    // Not bit-padded: rawSlice("4a") should loadUint(8) as 74 (0x4a)
    // Bit-padded: rawSlice("4a_") should loadUint(6) as 18
    receive() {
        let a: Int = rawSlice("4a").loadUint(8);
        let b: Int = rawSlice("4a_").loadUint(6);
        if (a == 74 && b == 18) {
            a;
        } else {
            b;
        }
    }
}

contract TestOptionalChain {
    // Test non-null optional string conversion through asSlice/asString.
    receive() {
        let s: String? = "Optional Test";
        if (s != null) {
            let s2: String = s!!.asSlice().asString();
            s2;
        } else {
            "Null";
        }
    }
}
