struct Pair {
    First: Int;
    Second: Int;
}

contract FuzzLoopReturn {
    fun loopReturn(x: Int): Int {
         let i: Int = 0;
         while (i < 10) {
             if (x + i > 15) { 
                 return x + i;
             }
             i = i + 1;
         }
         return -1;
    }
}

contract FuzzConditionalReturn {
    fun condReturn(a: Bool, b: Bool): Int {
         if (a) { return 100; }
         else if (b) { return 200; }
         else { return 300; }
    }
}

contract FuzzGetterComplex {
    x: Int = 7;
    y: Int = 9;
    get fun diff(): Int {
         if (self.x > self.y) { return self.x - self.y; }
         else { return self.y - self.x; }
    }
}

contract FuzzReceiverComplex {
    receive() {
         if (true) {
             return;
         }
    }
}

asm fun constantAsm(): Int { 123 INT }

contract FuzzImplicitAssemblyReturn {
    fun testAsm(): Int {
         return constantAsm();
    }
}

contract FuzzRecursionMultiple {
    fun factorial(n: Int): Int {
         if (n <= 1) { return 1; }
         else { return n * self.factorial(n - 1); }
    }
}
