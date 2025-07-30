struct MyTuple { a: Int; b: Int; }

message(1) TestMsg {
    value: Int as uint32
}

contract ReturnTests {
    v: Int = 0;

    receive () {}

    // Simple direct return
    fun directReturn(): Int {
         return 42;
    }

    // Nested return using block inside if
    fun nestedReturn(): Int {
         if (true) {
             { if (true) { return 55; } }
         }
         return 0;
    }

    // Early return test
    fun earlyReturn(n: Int): Int {
         if (n > 0) { return n; } else { return -n; }
    }
    
    // Implicit return test (last expression; semicolon optional)
    fun implicitReturnTest(): Int {
         return 100
    }

    // Return in loop test
    fun returnInLoop(n: Int): Int {
         repeat (n) {
             if (n == 2) { return 2; }
         }
         return 0;
    }
    
    // Getter returning a tuple via struct (using comma as field separator)
    get fun getterReturn(): MyTuple {
         return MyTuple { a: 3, b: 6 };
    }
    
    // Optional return test
    fun optionalReturn(a: Bool): Int? {
         if (a) { return 88; } else { return null; }
    }
    
    // Receiver with early return from its body, using a legal message type
    receive (msg: TestMsg) {
         if (msg.value > 100) { return; }
         // Otherwise, do nothing
    }
    
    // Complex return with nested blocks
    fun complexReturn(x: Int): Int {
         if (x < 0) {
             { return -1; }
         } else {
             if (x == 0) {
                 return 0;
             } else {
                 { if (x > 10) { return 10; } else { return x; } }
             }
         }
    }
}
