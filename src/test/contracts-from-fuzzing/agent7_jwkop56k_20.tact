/* Test: asm function using parameter reordering via arrangement with non-trivial stack manipulation.
   We define a function which takes three Int parameters: x, y, z.
   The parameters are pushed onto the stack: first x, then y, then z.
   Our goal is to produce a return value of type Pair { a: Int; b: Int } such that:
     a = z, and b = x.
   We achieve this by swapping y and z and then dropping y.
   With initial stack: s2: x, s1: y, s0: z.
   After SWAP: s2: x, s1: z, s0: y.
   Then DROP removes the top value (y), leaving: s1: z, s0: x.
   We then use arrangement (-> 1 0) which captures s1 as the first field and s0 as the second field.
   Thus, Pair.a becomes z and Pair.b becomes x as desired.
*/

struct Pair { a: Int; b: Int }

asm(-> 1 0) fun reorderTest(x: Int, y: Int, z: Int): Pair {
    SWAP
    DROP
}

fun main() : Int {
    let p: Pair = reorderTest(10, 20, 30);
    // p.a should be 30, and p.b should be 10
    return p.a - p.b; // expected: 30 - 10 = 20
}
