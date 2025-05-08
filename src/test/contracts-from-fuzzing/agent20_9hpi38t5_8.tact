asm fun addAsm(x: Int, y: Int): Int { x y ADD }

fun recFactorial(n: Int): Int {
    if (n <= 1) {
        return 1;
    } else {
        return n * recFactorial(n - 1);
    }
}

fun augmentedTest(): Int {
    let a: Int = 10;
    a += 5;
    return a;
}

fun blockAndIfTest(x: Int): Int {
    {
        let v = x * 2;
        dump(v);
    }
    return (x > 3) ? 100 : 50;
}

message Custom { val: Int; }

contract ReceiverFuzz {
    // Simple receiver for empty message
    receive() { dump(1); }
    
    // Receiver triggered by specific string
    receive("test") { dump(2); }

    // Fallback receiver for Slice messages
    receive(msg: Slice) { dump(3); }

    // Receiver for a custom message
    receive(msg: Custom) { dump(msg.val); }
}

fun main() {
    dump(addAsm(7, 8));          // Expected: 15
    dump(recFactorial(5));       // Expected: 120
    dump(augmentedTest());       // Expected: 15
    dump(blockAndIfTest(4));     // Should dump 8 from inner block; returns 100
}
