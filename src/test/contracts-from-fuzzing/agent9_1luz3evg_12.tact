struct InnerOpt {
    x: Int;
}

struct Complex {
    optionalInner: InnerOpt?;
    m: map<Int, Int>;
}

fun create_complex(): Complex {
    let mp: map<Int, Int> = emptyMap();
    mp.set(100, 1000);
    return Complex { optionalInner: InnerOpt { x: 55 }, m: mp };
}

contract TestComplexNested {
    receive() {
        let c = create_complex();
        if (c.optionalInner != null) {
            dump(c.optionalInner!!.x);
        } else {
            dump(0);
        }
        dump(c.m.get(100)!!);
    }
}
