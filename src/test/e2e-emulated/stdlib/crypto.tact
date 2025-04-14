contract Tester() {
    receive() {} // deploy

    // On-chain tests
    receive("keccak256") {
        // Hashes of short slices should match
        let s1 = "hello world".asSlice();
        let res1 = keccak256(s1);
        let res2 = keccak256IgnoreRefs(s1);
        require(res1 == res2, "Hashes of short slices (<128 bytes) didn't match!");

        // Hashes of long slices should NOT match
        let s2 = "------------------------------------------------------------------------------------------------------------------------------129".asSlice();
        res1 = keccak256(s2);
        res2 = keccak256IgnoreRefs(s2);
        require(res1 != res2, "Hashes of long slices (≥128 bytes) did match, but they should not have!");
    }

    // Off-chain tests
    get fun keccak256(data: Slice): Int {
        return keccak256(data);
    }

    // Off-chain tests
    get fun keccak256IgnoreRefs(data: Slice): Int {
        return keccak256IgnoreRefs(data);
    }
}

/// Keccak-256, but disregarding the refs and only hashing the data of the given Slice
asm fun keccak256IgnoreRefs(data: Slice): Int { ONE HASHEXT_KECCAK256 }
