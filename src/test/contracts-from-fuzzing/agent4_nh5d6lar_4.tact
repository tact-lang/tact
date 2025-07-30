struct AB { a: Int; b: Int }
struct Nested { ab1: AB; ab2: AB }

asm(-> 0) fun addAB(two: AB): Int { ADD }

asm fun mulOfSums(n: Nested): Int {
  let sum1 = addAB(n.ab1);
  let sum2 = addAB(n.ab2);
  sum1 sum2 ADD MUL
}

fun test() : Int {
  return mulOfSums(Nested{ ab1: AB{ a: 2, b: 3 }, ab2: AB{ a: 4, b: 5 } });
}