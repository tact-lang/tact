struct N1 { v: Int }
struct N2 { n1: N1 }
struct N3 { n2: N2 }
struct N4 { n3: N3 }
struct N5 { n4: N4 }
struct N6 { n5: N5 }
struct N7 { n6: N6 }
struct N8 { n7: N7 }

contract DeepChainTest {
    receive() {
        let nested = N8 { n7: N7 { n6: N6 { n5: N5 { n4: N4 { n3: N3 { n2: N2 { n1: N1 { v: 99 } } } } } } } };
        dump(nested.n7.n6.n5.n4.n3.n2.n1.v);
    }
}
