struct N1 { a: Int }
struct N2 { b: N1 }
struct N3 { c: N2 }
struct N4 { d: N3 }
struct N5 { e: N4 }

contract Nest5Test {
    val: N5;
    init() {
        self.val = N5{e:N4{d:N3{c:N2{b:N1{a:123}}}}};
    }
}