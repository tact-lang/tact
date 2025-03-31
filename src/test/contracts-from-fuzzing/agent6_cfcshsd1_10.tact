/*
Comprehensive Fuzz-Testing Cycle Report
---------------------------------------

In this fuzz-testing cycle, we explored two distinct sections of the official Tact documentation:

1. Getter Functions:
   - Documentation (see docs_book_contracts.md, Getter functions section) claims that getter functions should not modify state variables but strictly read them. 
   - We implemented a contract (GetterTest) with two getter functions: 
      • modifyGetter(): attempts to modify the state variable 'value' by adding 5
      • readGetter(): reads the state variable without modification
   - Our testing confirmed that while the getter function can modify the state variable at runtime, such modifications are ephemeral and do not persist after execution, aligning with practical behavior mentioned in the documentation.

2. Compile-Time Functions:
   - According to the Tact documentation (see docs_ref_core-comptime.md), functions such as address, cell, slice, and rawSlice embed compile-time constants into the contract.
   - We implemented a contract (CompileTimeTest) that embeds:
      • A compile-time address
      • A Cell constant from a base64-encoded string
      • A Slice from a base64-encoded string
      • A rawSlice from a hex string
   - The CompileTimeTest contract compiled successfully, and its fields were set as expected, verifying that compile-time functions behave as documented.

Both contracts compiled successfully and behaved in line with documented expectations:
   - Getter functions can modify state at runtime without persistent state changes
   - Compile-time constant functions properly incorporate provided constants into the contract state

This cycle did not uncover any severe discrepancies or confirmed bugs; rather, it validated that the runtime behavior (especially regarding getters) is consistent with practical constraints discussed in the documentation. Future fuzz-testing cycles will extend similar strategies to other documented language features.
*/

contract GetterTest {
    // State variable
    value: Int;

    init() {
        self.value = 10;
    }

    // Getter function that attempts to modify the state variable at runtime.
    // Documentation notes that getters should be read-only; however, runtime modifications occur, though they are non-persistent.
    get fun modifyGetter(): Int {
        self.value = self.value + 5;
        return self.value;
    }

    // Getter function that only reads the state variable
    get fun readGetter(): Int {
        return self.value;
    }

    // A receiver function for off-chain testing
    receive() {
        dump(self.value);
    }
}

contract CompileTimeTest {
    // Embedding an address as a compile-time constant
    addr: Address = address("EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N");

    // Embedding a base64-encoded cell constant
    storedCell: Cell = cell("te6cckEBAQEAYgAAwP8AIN0gggFMl7qXMO1E0NcLH+Ck8mCDCNcYINMf0x/TH/gjE7vyY+1E0NMf0x/T/9FRMrryoVFEuvKiBPkBVBBV+RDyo/gAkyDXSpbTB9QC+wDo0QGkyMsfyx/L/8ntVD++buA=");

    // Embedding a base64-encoded slice constant
    storedSlice: Slice = slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=");

    // Embedding a raw slice from hex (non-bit-padded)
    rawSliceTest: Slice = rawSlice("4a");

    // Receiver function to dump compile-time embedded address for verification
    receive() {
        dump(self.addr);
    }
}
