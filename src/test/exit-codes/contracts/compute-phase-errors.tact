import "./compute-phase-errors.fc";

contract ComputePhaseErrorsTester {
    // Used for storing temporary values
    tmpI: Int = 0;
    tmpC: Cell = cell("te6cckEBAQEAAgAAAEysuc0="); // empty cell

    /// To handle deployment
    receive() {}

    /// Exit code 0
    receive("0") {
        throw(0); // Yes, that still counts as a success
    }

    /// Exit code 1
    receive("1") {
        throw(1); // Yes, that still counts as a success
    }

    /// Exit code 2
    receive("2") {
        // Removes 100 elements from the stack, causing an underflow
        repeat (100) {
            drop();
        }
    }

    /// Exit code 3
    receive("3") {
        stackOverflow();
    }

    /// Exit code 4
    receive(msg: ExitCode4) {
        // Setup
        let targetCode = 4;
        let failed = true;

        // Addition
        try {
            self.tmpI = pow(2, 255) - 1 + pow(2, 255) + msg.val1;
            failed = false;
        } catch (exitCode) {
            nativeThrowIf(exitCode, exitCode != targetCode);
        }
        require(failed == true, "Addition didn't cause an integer overflow");

        // Subtraction
        try {
            self.tmpI = -pow(2, 255) - pow(2, 255) - msg.val1;
            failed = false;
        } catch (exitCode) {
            nativeThrowIf(exitCode, exitCode != targetCode);
        }
        require(failed == true, "Subtraction didn't cause an integer overflow");

        // Negation
        try {
            self.tmpI = -(-pow(2, 255) - pow(2, 255) + msg.val0);
            failed = false;
        } catch (exitCode) {
            nativeThrowIf(exitCode, exitCode != targetCode);
        }
        require(failed == true, "Negation didn't cause an integer overflow");

        // Multiplication
        try {
            self.tmpI = pow(2, 255) * (msg.val1 + 1);
            failed = false;
        } catch (exitCode) {
            nativeThrowIf(exitCode, exitCode != targetCode);
        }
        require(failed == true, "Multiplication didn't cause an integer overflow");

        // Division
        try {
            self.tmpI = (-pow(2, 255) - pow(2, 255)) / (-msg.val1);
            failed = false;
        } catch (exitCode) {
            nativeThrowIf(exitCode, exitCode != targetCode);
        }
        require(failed == true, "Division didn't cause an integer overflow");

        // Division by zero
        try {
            self.tmpI = 1 / msg.val0;
            failed = false;
        } catch (exitCode) {
            nativeThrowIf(exitCode, exitCode != targetCode);
        }
        require(failed == true, "Division by zero didn't cause an integer overflow");

        // Modulo by zero
        try {
            self.tmpI = 1 % msg.val0;
            failed = false;
        } catch (exitCode) {
            nativeThrowIf(exitCode, exitCode != targetCode);
        }
        require(failed == true, "Modulo by zero didn't cause an integer overflow");

        // As we got here, everything above caused the target exit code,
        // so let's throw it explicitly now for the tests on Blueprint's side
        throw(targetCode);
    }

    /// Exit code 5
    receive("5") {
        // Builder.storeUint() function can only use up to 256 bits,
        // so 512 is too much and the negative value cannot be stored either
        self.tmpC = beginCell().storeUint(-1, 512).endCell();
    }

    // Exit code 6
    receive("6") {
        invalidOpcode();
    }

    /// Exit code 7
    receive("7") {
        typeCheckError().get(0)!!;
    }

    /// Exit code 8
    receive("8") {
        // Setup
        let targetCode = 8;
        let failed = true;

        // Cell overflow (data)
        try {
            self.tmpC = beginCell()
                .storeInt(0, 250)
                .storeInt(0, 250)
                .storeInt(0, 250)
                .storeInt(0, 250)
                .storeInt(0, 24) // 1024 bits!
                .endCell();
            failed = false;
        } catch (exitCode) {
            nativeThrowIf(exitCode, exitCode != targetCode);
        }
        require(failed == true, "1024 bits didn't cause the cell overflow");

        // Cell overflow (refs)
        try {
            self.tmpC = beginCell()
                .storeRef(emptyCell())
                .storeRef(emptyCell())
                .storeRef(emptyCell())
                .storeRef(emptyCell())
                .storeRef(emptyCell()) // 5 refs!
                .endCell();
            failed = false;
        } catch (exitCode) {
            nativeThrowIf(exitCode, exitCode != targetCode);
        }
        require(failed == true, "5 refs didn't cause the cell overflow");

        // As we got here, everything above caused the target exit code,
        // so let's throw it explicitly now for the tests on Blueprint's side
        throw(targetCode);
    }

    /// Exit code 9
    receive("9") {
        // Setup
        let targetCode = 9;
        let failed = true;

        // Cell underflow (data)
        try {
            self.tmpI = emptySlice().loadInt(1);
            failed = false;
        } catch (exitCode) {
            nativeThrowIf(exitCode, exitCode != targetCode);
        }
        require(failed == true, "Loading 1 bit from an empty Slice didn't cause the cell underflow");

        // Cell underflow (refs)
        try {
            self.tmpC = emptySlice().loadRef();
            failed = false;
        } catch (exitCode) {
            nativeThrowIf(exitCode, exitCode != targetCode);
        }
        require(failed == true, "Loading 1 ref from an empty Slice didn't cause the cell underflow");

        // As we got here, everything above caused the target exit code,
        // so let's throw it explicitly now for the tests on Blueprint's side
        throw(targetCode);
    }

    /// Exit code 10
    receive("10") {
        // The Int to Int dictionary is being misinterpreted as a map<Int, Cell>
        let m: map<Int, Cell> = toMapIntCell(cellWithDictIntInt.beginParse());

        // And the error happens only when we touch it
        self.tmpC = m.get(0)!!;
    }

    /// Exit code 11
    receive("11") {
        // Unlike nativeSendMessage which uses SENDRAWMSG, this one uses SENDMSG,
        // and therefore fails in Compute time when the message is ill-formed
        nativeSendMessageReturnForwardFee(emptyCell(), 0);
    }

    /// Exit code 13 (-14, to be precise)
    receive("13") {
        let counter = 0;
        repeat (pow(2, 31) - 1) {
            counter += 1;
        }
    }
}

/// Exit code 4
message(4) ExitCode4 {
    val0: Int as uint2 = 0;
    val1: Int as uint2 = 1;
}

/// Pre-computed Int to Int dictionary with two entries — 0: 0 and 1: 1
const cellWithDictIntInt: Cell = cell("te6cckEBBAEAUAABAcABAgPQCAIDAEEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABAAQQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMLMbT1U=");

/// Tries to preload a dictionary from a Slice as a map<Int, Int>
asm fun toMapIntInt(x: Slice): map<Int, Int> { PLDDICT }

/// Tries to preload a dictionary from a Slice as a map<Int, Cell>
asm fun toMapIntCell(x: Slice): map<Int, Cell> { PLDDICT }

/// Non-existent opcode
asm fun invalidOpcode() { x{D7FF} @addop }

/// DROP
asm fun drop() { DROP }

/// Stack overflow
@name(stack_overflow)
native stackOverflow();

/// Type check error
asm fun typeCheckError(): map<Int, Int> { 42 PUSHINT }
