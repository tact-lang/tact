/// Fuzz-testing type system: Testing primitives, optionals, maps, structs, messages, tuples and arithmetic expressions

struct Pair { first: Int; second: Int; }

struct MyStruct { x: Int; }

message MyMsg { y: Int as uint8; }

contract TestPrimitive {
    fun test() {
        let a: Int = 1 + 2;
        let b = 3 * 4;
        let flag: Bool = true && false;
        let cell: Cell = beginCell().storeUint(5, 3).endCell();
        dump(a);
        dump(b);
        dump(flag);
        dump(cell);
    }
    receive() {
        self.test();
        cashback(sender());
    }
}

contract TestOptional {
    fun test() {
        let opt: Int? = null;
        opt = 100;
        dump(opt!!);
        if (opt != null) {
            dump(1);
        } else {
            dump(0);
        }
    }
    receive() { self.test(); cashback(sender()); }
}

contract TestMap {
    fun test() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 10);
        m.set(2, 20);
        dump(m.get(1)!!);
        m.replaceGet(1, 100);
        dump(m.get(1)!!);
        m.del(2);
        dump(m.exists(2));
    }
    receive() { self.test(); cashback(sender()); }
}

contract TestStructMsg {
    fun test_struct() {
        let s: MyStruct = MyStruct{ x: 42 };
        let cell = s.toCell();
        let s2 = MyStruct.fromCell(cell);
        dump(s2.x);
    }
    fun test_message() {
        let msg: MyMsg = MyMsg{ y: 7 };
        let cell = msg.toCell();
        let msg2 = MyMsg.fromCell(cell);
        dump(msg2.y);
    }
    receive() {
        self.test_struct(); 
        self.test_message();
        cashback(sender());
    }
}

contract TestDestructuring {
    fun test() {
        let p: Pair = Pair{ first: 10, second: 20 };
        let Pair{ first, second } = p;
        dump(first);
        dump(second);
    }
    receive() { self.test(); cashback(sender()); }
}

contract TestArithmetic {
    fun test() {
        let a = 5;
        let b = 4;
        let c = a + b - a * b / a % b;
        dump(c);
    }
    receive() { self.test(); cashback(sender()); }
}
