contract TestPrimitive {
    fun showcase() {
        let a: Int = 10;
        let b: Bool = true;
        let c: Cell = emptyCell();
        let d: Int = a + 5;
        let e: Bool = !b;
        dump(d); // should print 15
        dump(e); // should print false
    }
    receive() {
        self.showcase();
        cashback(sender());
    }
}

contract TestOptionals {
    fun showcase() {
        let opt: Int? = null;
        opt = 255;
        dump(opt!!); // should print 255
    }
    receive() {
         self.showcase();
         cashback(sender());
    }
}

struct One { number: Int; }

contract TestStruct {
    fun showcase() {
         let o: One = One{ number: 50 };
         let c: Cell = o.toCell();
         let o2: One = One.fromCell(c);
         dump(o2.number); // should print 50
    }
    receive() {
         self.showcase();
         cashback(sender());
    }
}

contract TestMaps {
   fun showcase() {
       let m: map<Int, Int> = emptyMap();
       m.set(0, 10);
       let v: Int = m.get(0)!!;
       dump(v); // should print 10
   }
   receive() {
      self.showcase();
      cashback(sender());
   }
}

message(123) MyMsg {
    val: Int as uint8;
}

contract TestMessages {
    fun showcase() {
         let msg: MyMsg = MyMsg{ val: 42 };
         let cell: Cell = msg.toCell();
         let msg2: MyMsg = MyMsg.fromCell(cell);
         dump(msg2.val); // should print 42
    }
    receive() {
         self.showcase();
         cashback(sender());
    }
}

struct Param { value: Int?; }

contract TestOptionalStruct {
    fun showcase() {
         let p: Param = Param{ value: 255 };
         dump(p.value!!); // should print 255
    }
    receive() {
         self.showcase();
         cashback(sender());
    }
}
