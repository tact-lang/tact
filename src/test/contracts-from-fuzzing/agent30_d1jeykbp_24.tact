struct N1 {
    x: Int;
}

struct N2 {
    n1: N1;
}

struct N3 {
    n2: N2;
}

struct N4 {
    n3: N3;
}

struct N5 {
    n4: N4;
}

struct N6 {
    n5: N5;
}

struct N7 {
    n6: N6;
}

struct N8 {
    n7: N7;
}

struct N9 {
    n8: N8;
}

struct N10 {
    n9: N9;
}

struct N11 {
    n10: N10;
}

struct N12 {
    n11: N11;
}

struct N13 {
    n12: N12;
}

struct N14 {
    n13: N13;
}

struct N15 {
    n14: N14;
}

struct N16 {
    n15: N15;
}

struct N17 {
    n16: N16;
}

struct N18 {
    n17: N17;
}

struct N19 {
    n18: N18;
}

struct N20 {
    n19: N19;
}

contract TestDeepChain20 {
    receive() {
        // Build the nested chain starting at N1 with x = 100
        let n1: N1 = N1{ x: 100 };
        let n2: N2 = N2{ n1: n1 };
        let n3: N3 = N3{ n2: n2 };
        let n4: N4 = N4{ n3: n3 };
        let n5: N5 = N5{ n4: n4 };
        let n6: N6 = N6{ n5: n5 };
        let n7: N7 = N7{ n6: n6 };
        let n8: N8 = N8{ n7: n7 };
        let n9: N9 = N9{ n8: n8 };
        let n10: N10 = N10{ n9: n9 };
        let n11: N11 = N11{ n10: n10 };
        let n12: N12 = N12{ n11: n11 };
        let n13: N13 = N13{ n12: n12 };
        let n14: N14 = N14{ n13: n13 };
        let n15: N15 = N15{ n14: n14 };
        let n16: N16 = N16{ n15: n15 };
        let n17: N17 = N17{ n16: n16 };
        let n18: N18 = N18{ n17: n17 };
        let n19: N19 = N19{ n18: n18 };
        let n20: N20 = N20{ n19: n19 };
        // Access the deeply nested value
        n20.n19.n18.n17.n16.n15.n14.n13.n12.n11.n10.n9.n8.n7.n6.n5.n4.n3.n2.n1.x;
    }
}
