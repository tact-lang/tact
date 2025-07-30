//// Fuzz-testing of Tact type system and related features

// Test 1: Integer Division Rounding
// Expected behavior: 3/2 = 1 and -3/2 = -2 (floor division rounding towards -∞)
contract TestIntegerDivision {
    fun test() {
        let a: Int = 3 / 2;    // expected 1
        let b: Int = -3 / 2;   // expected -2
        dump(a); // should dump 1
        dump(b); // should dump -2
    }
    receive() { self.test(); }
}

// Test 2: Optional Struct
struct A { x: Int; }
contract TestOptionalStruct {
    fun test() {
        let opt: A? = null;
        opt = A { x: 44 };
        dump(opt!!.x); // should dump 44
    }
    receive() { self.test(); }
}

// Test 3: Map with Struct Values
contract TestMapStruct {
    fun test() {
        let m: map<Int, A> = emptyMap();
        m.set(1, A { x: 55 });
        dump(m.get(1)!!.x); // should dump 55
        dump(m.del(1));      // should dump true
        dump(m.del(1));      // should dump false (idempotent deletion)
    }
    receive() { self.test(); }
}

// Test 4: Global Extension Mutation Function
// Define a global extension mutation function
extends mutates fun inc(self: Int) {
    self += 1;
}

contract TestExtensionMut {
    fun test() {
        let a: Int = 7;
        a.inc();
        dump(a); // should dump 8
    }
    receive() { self.test(); }
}

// Test 5: Try-Catch with throw
contract TestTryCatch {
    fun test() {
        try {
            throw(777);
        } catch (code) {
            dump(code); // should dump 777
        }
    }
    receive() { self.test(); }
}

// Test 6: Repeat Loop and Mutable Variable
contract TestRepeat {
    fun test() {
        // In Tact, variables declared with let are mutable via reassignment
        let i: Int = 0;
        repeat (4) {
            i = i + 1;
        }
        dump(i); // expected to dump 4

        let cnt: Int = 0;
        repeat (4) {
            cnt = cnt + 2;
        }
        dump(cnt); // expected to dump 8
    }
    receive() { self.test(); }
}

// Test 7: Numeric Literals in Various Bases with Underscores
contract TestNumerics {
    fun test() {
        let dec: Int = 1_000_000;         // decimal
        let bin: Int = 0b1010_1010;         // binary (170 in decimal)
        let oct: Int = 0o70;                // octal (56 in decimal)
        let hex: Int = 0xFF_FF;             // hexadecimal (65535 in decimal)
        dump(dec);
        dump(bin);
        dump(oct);
        dump(hex);
    }
    receive() { self.test(); }
}

// Test 8: Conversion of String to Cell via asComment
contract TestStringAsComment {
    fun test() {
        let cell: Cell = "hello".asComment();
        // Instead of calling cell.bits(), just dump the cell as is
        dump(cell);
    }
    receive() { self.test(); }
}

// Test 9: Message Struct with Expression-based Opcode and Nested Structs
message MyImplicit {} // empty message for nesting

message((crc32("Tact") + 42) & 0xFFFF_FFFF) MsgExpr {
    field1: Int as uint4;  // 4-bit unsigned integer
    field2: Bool?;
    field3: A;             // nested struct A
    field4: MyImplicit;    // nested message struct
}

contract TestMsgExpr {
    fun test() {
        let msg: MsgExpr = MsgExpr {
            field1: 5,
            field2: true,
            field3: A { x: 77 },
            field4: MyImplicit{}
        };
        dump(msg.field1);         // should dump 5
        dump(msg.field2);         // should dump true
        dump(msg.field3.x);       // should dump 77
    }
    receive() { self.test(); }
}

// Test 10: Primitive Operations and Builder/Slice Conversion
contract TestPrimitiveOps {
    fun test() {
        // Arithmetic test: 5 + 3 * 2 - 4 / 2 = 5 + 6 - 2 = 9
        let result: Int = 5 + 3 * 2 - 4 / 2;
        dump(result); // should dump 9

        // Builder and Slice test: storeUint and storeInt
        let bb: Builder = beginCell()
            .storeUint(3, 3)   // store number 3 in 3 bits
            .storeInt(-2, 4);   // store -2 in 4 bits
        let c: Cell = bb.endCell();
        let sl: Slice = c.asSlice();
        let u: Int = sl.loadUint(3);
        let i: Int = sl.loadInt(4);
        dump(u); // should dump 3
        dump(i); // should dump -2
    }
    receive() { self.test(); }
}

// End of fuzz-testing snippet
