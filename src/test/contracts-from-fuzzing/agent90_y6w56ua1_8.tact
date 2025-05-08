contract TestOptionalReturn {
    fun test(): Int? {
         if (1 == 1) {
             return 42;
         }
         return null;
    }
}

contract TestMultipleNestedReturn {
    fun test(a: Bool): Int {
         if (a) {
             { 
                if (!a) {
                    return 10;
                }
                return 20;
             }
         }
         return 30;
    }
}

contract TestReturnLoopNested {
    fun test(x: Int): Int {
         repeat (5) {
             if (x == 3) {
                 return x;
             }
         }
         return -1;
    }
}

contract TestGetterReturnNoSemi {
    get fun testGetter(): Int {
         return 99
    }
}
