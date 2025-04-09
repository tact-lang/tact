struct Inner {
    a: Int;
    opt: Int?;
}

struct Middle {
    inner: Inner;
    m: map<Int, Int>;
}

struct Outer {
    mid: Middle;
    y: Int;
}

fun compute(outer: Outer): Int {
    let a = outer.mid.inner.a;
    let optVal: Int = outer.mid.inner.opt != null ? outer.mid.inner.opt!! : 0;
    let total: Int = a + optVal + outer.y;
    let mapSum: Int = 0;
    foreach (k, v in outer.mid.m) {
        mapSum = mapSum + k + v;
    }
    return total + mapSum;
}

contract TestContract {
    receive() {
        let mp: map<Int, Int> = emptyMap();
        mp.set(10, 100);
        mp.set(20, 200);
        let inner: Inner = Inner { a: 50, opt: 25 };
        let mid: Middle = Middle { inner: inner, m: mp };
        let out: Outer = Outer { mid: mid, y: 5 };
        let res = compute(out);
    }
}
