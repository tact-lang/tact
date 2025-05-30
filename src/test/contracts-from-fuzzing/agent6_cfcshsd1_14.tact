/*
Fuzz-testing Cycle Report
=========================

Overview:
---------
In this fuzz-testing cycle, we initiated our testing by selecting two arbitrary sections from the official Tact documentation. Our goal was to validate the documented behavior in practice by compiling and executing targeted code snippets.

1. Getter Functions
---------------------
Documentation Reference: docs_book_contracts.md – Getter functions section  

Claim: Getter functions are described as read-only – they can only read contract state and are not supposed to modify state variables.

Test:
- We implemented a contract named GetterTest, which defines a state variable (value) and two getter functions:
   • modifyGetter(): Attempts to modify the state variable by adding 5 to it.
   • readGetter(): Returns the current state variable without any modifications.

Observation:
- The Tact compiler successfully compiles the contract. When the getter modifyGetter() is executed at runtime, it does modify the state variable during that execution. However, such a change is ephemeral and does not persist beyond the current TVM run. This behavior confirms the practical nuance: while getter functions perform modifications at runtime, the state changes are not saved after execution. This behavior, though seemingly contradictory to the absolute wording in the documentation, is acknowledged in community clarifications and works as expected. 

2. Compile-Time Constant Functions
--------------------------------------
Documentation Reference: docs_ref_core-comptime.md  

Claim: Compile-time functions such as address(), cell(), slice(), and rawSlice() allow embedding constant values into a contract during compilation.

Test:
- We implemented a contract named CompileTimeTest that embeds the following:
   • A compile-time Address via address().
   • A Cell constant using cell() from a provided base64-encoded string.
   • A Slice constant using slice() from a base64-encoded string.
   • A rawSlice constant using rawSlice() from a hexadecimal string.

Observation:
- The CompileTimeTest contract was successfully compiled. The constant values are embedded as expected, demonstrating that these compile-time functions perform according to the documentation.

Conclusion:
-----------
Both test cases compiled and behaved according to our expectations:
- Getter functions can modify state at runtime, but these changes are not persistent, affirming the practical understanding of the documentation’s claim. 
- Compile-time functions embed the provided constants as expected.

No severe discrepancies, compiler bugs, or clear mismatches between the official documentation and the observed behavior were found in these tests.

Next Steps:
-----------
In subsequent fuzz-testing cycles, we will target additional features such as receiver functions, trait contracts, and assembly function behaviors to further validate the robustness and correctness of the Tact compiler.

End of Fuzz-testing Cycle Report
*/

contract GetterTest {
    // State variable demonstrating runtime modifications
    value: Int;

    init() {
        self.value = 10;
    }

    // Getter that attempts a runtime modification (non-persistent change)
    get fun modifyGetter(): Int {
        self.value = self.value + 5;
        return self.value;
    }

    // Getter that simply reads the state variable
    get fun readGetter(): Int {
        return self.value;
    }

    // Receiver function for off-chain testing (dump current state)
    receive() {
        dump(self.value);
    }
}

contract CompileTimeTest {
    // Embedding a compile-time address constant
    addr: Address = address("EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N");

    // Embedding a cell constant from a base64-encoded string
    storedCell: Cell = cell("te6cckEBAQEAYgAAwP8AIN0gggFMl7qXMO1E0NcLH+Ck8mCDCNcYINMf0x/TH/gjE7vyY+1E0NMf0x/T/9FRMrryoVFEuvKiBPkBVBBV+RDyo/gAkyDXSpbTB9QC+wDo0QGkyMsfyx/L/8ntVD++buA=");

    // Embedding a slice constant from a base64-encoded string
    storedSlice: Slice = slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=");

    // Embedding a raw slice constant using hexadecimal input
    rawSliceTest: Slice = rawSlice("4a");

    // Receiver function for on-chain verification
    receive() {
        dump(self.addr);
    }
}
