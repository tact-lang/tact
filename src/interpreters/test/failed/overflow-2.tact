primitive Int;

fun test(v: Int): Int {
    let n: Int = 1;
    let exponent: Int = 246;
    let repeatTimes: Int = 10;
    let result: Int = 0;

    repeat (repeatTimes) {          // Analyzer runs the loop because it is below the current limit of 2 ^ 12 = 4096 iterations.
                                    // Above the limit, it does a fix-point computation
        exponent += 1;              
        result = n << exponent;     // Reported overflow in the 10th iteration.
    }
    
    return result;
}