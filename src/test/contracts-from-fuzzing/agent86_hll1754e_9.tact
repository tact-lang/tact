struct S { a: Int; b: Int }

fun getA(s: S): Int {
    // Attempting to use wildcard in a destructuring assignment for field 'b'
    let S { a: a, b: _ } = s;
    return a;
}

contract Test {
    receive() {
        let s = S { a: 10, b: 20 };
        let x = getA(s);
    }
}
