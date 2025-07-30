contract RegularReturn2 {
    // Early return
    fun earlyReturn(x: Int): Int {
        if (x > 0) {
            return 100;
        }
        return -1;
    }

    // Fully covered branches
    fun allReturn(x: Int): Int {
        if(x == 0) {
            return 0;
        } else {
            return 1;
        }
    }

    // Nested block return
    fun nestedReturn(): Int {
       { { return 42; } }
    }
}

struct Pair {
    fst: Int;
    snd: Int;
}

contract GetterReturn2 {
    a: Int;
    b: Int;
    
    init() {
        self.a = 10;
        self.b = 20;
    }

    // Getter returning a struct (tuple equivalent)
    get fun getPair(): Pair {
       if(self.a >= self.b) {
         return Pair { fst: self.a, snd: self.b };
       } else {
         return Pair { fst: self.b, snd: self.a };
       }
    }
}

contract ReceiverReturn2 {
    // Receiver with an explicit return statement
    receive() {
         return;
    }
}

contract UnitReturn2 {
    // Unit function with explicit return
    fun unitFun() {
       return;
    }
}
