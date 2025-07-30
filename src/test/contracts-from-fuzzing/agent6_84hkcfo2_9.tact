contract TestAddressValid {
    // Testing address() compile-time function with a valid address string
    // This address is taken from the documentation and should compile successfully.
    addr: Address = address("EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N");

    receive() {
    }
}

contract TestAsciiEdge {
    // Testing ascii() compile-time function with exactly 32 bytes input.
    // Using eight thumbs (each 4 bytes) to reach 32 bytes exactly.
    // 👍 has the UTF-8 encoding F0 9F 91 8D.
    val: Int = ascii("👍👍👍👍👍👍👍👍");

    receive() {
    }
}

contract TestTonValid {
    // Testing ton() compile-time function with a valid human-readable value
    one: Int = ton("1");            // Expected: 10^9 nanoToncoins
    pointOne: Int = ton("0.1");       // Expected: 10^8 nanoToncoins
    nano: Int = ton("0.000000001");   // Expected: 1 nanoToncoin

    receive() {
    }
}

contract TestCellValid {
    // Testing cell() compile-time function with a valid base64-encoded BoC
    // Using a minimal BoC; this one is taken from documentation
    stored: Cell = cell("te6cckEBAQEAYgAAwP8AIN0gggFMl7qXMO1E0NcLH+Ck8mCDCNcYINMf0x/TH/gjE7vyY+1E0NMf0x/T/9FRMrryoVFEuvKiBPkBVBBV+RDyo/gAkyDXSpbTB9QC+wDo0QGkyMsfyx/L/8ntVD++buA=");

    receive() {
    }
}

contract TestSliceValid {
    // Testing slice() compile-time function with a valid base64-encoded BoC
    stored: Slice = slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=");

    receive() {
    }
}

contract TestRawSliceBitPadded {
    // Testing rawSlice() compile-time function with a valid bit-padded hex string.
    // According to docs: '4a_' is bit-padded and should produce a slice where loadUint(6) gives 18.
    stored: Slice = rawSlice("4a_");
    
    receive() {
    }
}

contract TestCrc32Valid {
    // Testing crc32() compile-time function with a valid non-empty string
    checksum: Int = crc32("000DEADBEEF000");

    receive() {
    }
}
