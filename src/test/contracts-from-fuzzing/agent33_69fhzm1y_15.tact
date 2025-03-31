struct Inner { a: Int; }
struct Outer { inner: Inner; }

fun nestedDiscard(outer: Outer): Int {
    let Outer { inner } = outer;
    let Inner { a: _ } = inner;
    return 0;
}

contract Test {
    receive() {
        let o = Outer { inner: Inner { a: 123 } };
        let res = nestedDiscard(o);
        dump(res);
    }
}
