struct AB { a: Int; b: Int }

asm fun sum(two: AB): Int { ADD }

fun main() : Int {
    return sum(AB{ a: 27, b: 50 });
}
