import "./compute-phase-errors.fc";

contract ComputePhaseErrorsTester {
    // Used for storing temporary values
    tmpI: Int as uint8 = 0;
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
    receive("4") {
        // TODO: integer overflow

        // Addition

        // Subtraction

        // Negation

        // Multiplication

        // Division

        // Division by zero

        // Modulo by zero

        // FIXME:
        throw(4);
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
        // TODO:
        // - [ ] cell overflow (data)
        // - [ ] cell overflow (refs)

        // FIXME:
        throw(8);
    }

    /// Exit code 9
    receive("9") {
        // TODO:
        // - [ ] cell underflow (data)
        // - [ ] cell underflow (refs)

        // FIXME:
        throw(9);
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
