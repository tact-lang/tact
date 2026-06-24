struct N1 { val: Int; }
struct N2 { x: Int; n1: N1; }
struct N3 { x: Int; n2: N2; }
struct N4 { x: Int; n3: N3; }
struct N5 { x: Int; n4: N4; }

contract Test {
    deep: N5 = N5{x: 5, n4:N4{x:4, n3:N3{x:3, n2:N2{x:2, n1:N1{val:1}}}}};
}
