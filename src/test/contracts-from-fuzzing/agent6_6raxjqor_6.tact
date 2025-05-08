struct L3 {
    v: Int;
}

struct L2 {
    l3: L3;
}

struct L1 {
    l2: L2;
}

contract DeepNestedTest {
    receive() {
         let deep: L1 = L1 { l2: L2 { l3: L3 { v: 99 } } };
         dump(deep.l2.l3.v);
    }
}
