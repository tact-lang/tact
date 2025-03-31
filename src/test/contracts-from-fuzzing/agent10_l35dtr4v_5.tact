fun testTryCatch() : Int {
    try {
         throw(42);
    } catch (err) {
         return err + 1;
    }
}

fun testWhile() : Int {
    let x: Int = 5;
    while (x > 0) {
         // Assuming reassignment on let-declared variables is allowed
         x = x - 1;
    }
    return x;
}

fun testRepeat() : Int {
    let twoPow: Int = 1;
    repeat (3) {
         twoPow *= 2;
    }
    return twoPow;
}

fun testDoUntil() : Int {
    let x: Int = 3;
    do {
         x = x - 1;
    } until (x <= 0);
    return x;
}

fun testForeach() : Int {
    let m: map<Int, Int> = emptyMap();
    m.set(1, 100);
    m.set(2, 200);
    let sum: Int = 0;
    foreach (k, v in m) {
         sum += v;
    }
    return sum;
}

fun testIfElse() : Int {
    if (true) {
         return 101;
    } else {
         return 202;
    }
}
