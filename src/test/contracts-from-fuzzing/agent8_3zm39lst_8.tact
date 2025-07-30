struct Tuple {
    a: Int;
    b: Int;
}

contract TestReturnSimple {
    get fun simple(): Int {
        return 42;
    }
}

contract TestReturnEarly {
    get fun early(x: Int): Int {
        if (x > 10) {
            return x;
        }
        let a = x + 1;
        return a;
    }
}

contract TestNestedReturn {
    get fun deep(): Int {
         { let a = 5; return a; }
    }
}

contract TestReturnLoop {
    get fun loopReturn(n: Int): Int {
         let sum: Int = 0;
         repeat (n) {
             if (sum > 10) {
                 return sum;
             }
             sum += 1;
         }
         return sum;
    }
}

contract TestProcedure {
    fun procedure() {
       return;
    }
}

contract TestReturnReceiver {
    receive() {
       return;
    }
}

contract TestTupleReturn {
    get fun getTuple(): Tuple {
      return Tuple{a: 1, b: 2};
    }
}

contract TestOptionalReturn {
    get fun maybe(x: Int): Int? {
        if (x > 5) { 
            return x; 
        }
        return null;
    }
}

contract TestUnitProc {
    fun unitProc() {
       return;
    }
}

contract TestNoSemicolon {
    get fun noSemi(): Int {
       return 10
    }
}

contract TestBlockReturn {
    get fun blockReturn(): Int {
        if (true) {
            { return 7; }
        }
        return 0;
    }
}
