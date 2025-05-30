struct ComplexStruct {
    opt: Int?;
    m: map<Int, Int>;
}

fun process(cs: ComplexStruct): Int {
    let optVal: Int = cs.opt != null ? cs.opt!! : 0;
    let sum: Int = optVal;
    foreach (k, v in cs.m) {
        sum = sum + k + v;
    }
    return sum;
}

contract TestContract {
    receive() {
        let mm: map<Int, Int> = emptyMap();
        mm.set(2, 20);
        mm.set(3, 30);
        let cs: ComplexStruct = ComplexStruct { opt: 5, m: mm };
        let r = process(cs);
    }
}
