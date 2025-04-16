struct AB { a: Int; b: Int }

asm(-> 0) fun sum(two: AB): Int { ADD }

fun test() : Int {
  return sum(AB { a: 27, b: 15});
}