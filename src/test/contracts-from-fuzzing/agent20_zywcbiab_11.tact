/* Comprehensive Fuzz-Testing of the Tact Type System and Related Features
   Revised suite after corrections.
*/

// 1. PrimitiveTest
contract PrimitiveTest {
    fun test() {
        let sum: Int = 1 + 1;             // Expected: 2
        dump(sum);
        let div: Int = 3 / 2;             // Expected: 1 (rounding toward -∞)
        dump(div);
        let b: Bool = true && false;      // Expected: false
        dump(b);
        
        // Correct usage: Convert a Cell to a Slice then call bits()
        let cell: Cell = "hello".asComment();
        let s: Slice = cell.beginParse();
        dump(s.bits()); // Dumps number of bits in the slice
    }
    receive() {
        self.test();
    }
}

// 2. OptionalTest
contract OptionalTest {
    fun test() {
        let opt: Int? = null;
        opt = 123;
        dump(opt!!); // Expected: 123

        let optB: Bool? = null;
        if (optB != null) {
            dump(1);
        } else {
            dump(0);   // Expected: 0
        }
    }
    receive() {
        self.test();
    }
}

// 3. MapTest
contract MapTest {
    fun test() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        m.set(2, 200);
        dump(m.get(1)!!);            // Expected: 100
        let old = m.replaceGet(1, 50); // Expected old: 100
        dump(old);
        dump(m.get(1)!!);            // Expected: 50
        let delRes = m.del(1);
        dump(delRes);                // Expected: true
        dump(m.exists(1));           // Expected: false
        dump(m.del(1));              // Expected: false
    }
    receive() {
        self.test();
    }
}

// 4. StructTest
struct MyStruct { a: Int; b: Bool; }
contract StructTest {
    fun test() {
        let s: MyStruct = MyStruct{ a: 42, b: true };
        let cell = s.toCell();
        let s2 = MyStruct.fromCell(cell);
        dump(s2.a); // Expected: 42
        dump(s2.b); // Expected: true
    }
    receive() {
        self.test();
    }
}

// 5. MessageTest
message TestMsg { val: Int as uint8; }
contract MessageTest {
    fun test() {
        let msgCell = TestMsg{ val: 200 }.toCell();
        let msg2 = TestMsg.fromCell(msgCell);
        dump(msg2.val); // Expected: 200
    }
    receive() {
        self.test();
    }
}

// 6. SliceUnderflowTest
contract SliceUnderflowTest {
    fun test() {
        let s: Slice = beginCell().storeUint(5, 3).asSlice();
        try {
            let x = s.loadUint(7); // Should trigger underflow
            dump(x);
        } catch (exitCode) {
            dump(exitCode); // Expected exit code: 9 (Cell underflow)
        }
    }
    receive() {
        self.test();
    }
}

// 7. OperatorTest
contract OperatorTest {
    fun test() {
        let result = false ? 1 : true ? 2 : 3; // Expected: 2
        dump(result);
    }
    receive() {
        self.test();
    }
}

// 8. ExtensionTest
extends fun toCoinsString2(self: Int): String {
    return self.toFloatString(9);
}

contract ExtensionTest {
    fun test() {
        let s: String = 5.toCoinsString2();
        dump(s); // Expected: 0.000000005
    }
    receive() {
        self.test();
    }
}

// 9. OptionalAssignTest
contract OptionalAssignTest {
    fun test() {
        let opt: Int? = 5; // Valid assignment
        dump(opt!!);     // Expected: 5
    }
    receive() {
        self.test();
    }
}

// 10. InlineTest
inline fun myReply(str: String) {
    dump(str);
}

contract InlineTest {
    fun test() {
        myReply("hello world");
    }
    receive() {
        self.test();
    }
}

// 11. DestructTest
struct Point { x: Int; y: Int; }
contract DestructTest {
    fun test() {
        let p: Point = Point{ x: 10, y: 20 };
        let Point { x, .. } = p;
        dump(x); // Expected: 10
    }
    receive() {
        self.test();
    }
}

// 12. ConstTest
const MY_CONST: Int = 10 + 20;
contract ConstTest {
    fun test() {
        dump(MY_CONST); // Expected: 30
    }
    receive() {
        self.test();
    }
}

// 13. DoUntilTest
contract DoUntilTest {
    fun test() {
        let x = 0;
        do {
            x = x + 1;
        } until (x >= 3);
        dump(x); // Expected: 3
    }
    receive() {
        self.test();
    }
}

// 14. TraitTest
// Testing trait constants. In this test we define the trait with an abstract constant and a virtual constant.
// The contract overrides the abstract constant with a literal value.
trait MyTrait {
    abstract const overrideMe: Int;
    virtual const myVirt: Int = 42;
}

contract TraitTest() with MyTrait {
    // Provide literal override of the abstract constant
    override const overrideMe: Int = 777;
    fun test() {
        dump(self.overrideMe); // Expected: 777
        dump(self.myVirt);     // Expected: 42
    }
    receive() {
        self.test();
    }
}

// 15. ExprMsgTest
message ((crc32("Tact") + 42) & 0xFFFF_FFFF) ExprMsg { field: Int as uint4; }
contract ExprMsgTest {
    fun test() {
        let msgCell = ExprMsg{ field: 7 }.toCell();
        let msg = ExprMsg.fromCell(msgCell);
        dump(msg.field); // Expected: 7
    }
    receive() {
        self.test();
    }
}

// 16. BitwiseTest
contract BitwiseTest {
    fun test() {
        let a = 5; let b = 4;
        dump(a & b); // Expected: 4
        dump(a | b); // Expected: 5
        dump(a ^ b); // Expected: 1
    }
    receive() {
        self.test();
    }
}

// End of comprehensive fuzz-testing suite
