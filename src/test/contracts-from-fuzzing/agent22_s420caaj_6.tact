struct L1 { a: Int; }
struct L2 { l1: L1; b: Int; }
struct L3 { l2: L2; c: Int; }
struct L4 { l3: L3; d: Int; }

fun sum_deep(l4: L4): Int {
    return l4.l3.c + l4.l3.l2.b + l4.l3.l2.l1.a + l4.d;
}

contract TestDeepNested {
    receive() {
        let d: L4 = L4{ l3: L3{ l2: L2{ l1: L1{ a: 5 }, b: 10 }, c: 15 }, d: 20 };
        sum_deep(d);
    }
}
