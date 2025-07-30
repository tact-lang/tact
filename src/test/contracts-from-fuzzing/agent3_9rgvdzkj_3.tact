struct AB { a: Int; b: Int }

// This asm function flattens the struct parameter AB into two integers and then adds them.
asm fun sumAB(two: AB): Int { ADD }

fun main(): Int {
    // This should return 3+4 = 7
    return sumAB(AB{ a: 3, b: 4 });
}
