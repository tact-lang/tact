asm fun failParam(foo: Int): Int { foo }

fun main() : Int {
    return failParam(20);
}
