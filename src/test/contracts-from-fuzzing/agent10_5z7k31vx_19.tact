fun fact(n: Int, acc: Int) : Int {
    if (n == 0) { 
        return acc; 
    } else { 
        return fact(n - 1, n * acc); 
    }
}

fun testMapReplaceAndGet() : Int {
    let m: map<Int, Int> = emptyMap();
    m.set(1, 10);
    m.set(2, 20);
    m.replace(1, 15);
    let v: Int? = m.get(1);
    if (v != null) { 
        return v!!; 
    } else { 
        return 0; 
    }
}

asm fun asmInc(x: Int): Int { INC }

fun testRepeat() : Int {
    repeat (3) { /* do nothing */ }
    return 0;
}

fun main() : Int {
    let a = fact(5, 1);         // 5! = 120
    let b = testMapReplaceAndGet(); // should return 15
    let c = asmInc(99);           // 99 + 1 = 100
    testRepeat();
    return a + b + c;             // expected: 120 + 15 + 100 = 235
}
