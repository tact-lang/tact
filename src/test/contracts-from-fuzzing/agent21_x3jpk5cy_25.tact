struct Trio { a: Int; b: Int; c: Int }

fun testTrio(t: Trio): Int {
    let Trio { a: _, b, c: _ } = t;
    return b;
}

contract Test {
    receive() {
         testTrio(Trio { a: 1, b: 2, c: 3 });
    }
}
