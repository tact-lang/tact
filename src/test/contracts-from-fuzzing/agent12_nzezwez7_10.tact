/* Test 10: Nested Default Values Test
   Expected: 7 (default in Inner.a) + 10 (provided for Inner.b) + 3 (default in Outer.c) = 20
*/

struct Inner {
    a: Int = 7;
    b: Int;
}

struct Outer {
    inner: Inner;
    c: Int = 3;
}

fun main(): Int {
    let o = Outer{ inner: Inner{ b: 10 } };
    return o.inner.a + o.inner.b + o.c;
}
