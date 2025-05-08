struct N1 { a: Int }
struct N2 { b: N1 }
struct N3 { c: N2 }
struct N4 { d: N3 }
struct N5 { e: N4 }
struct N6 { f: N5 }
struct N7 { g: N6 }

contract TestContract {
    deep: N7;
    init() {
        self.deep = N7{g:N6{f:N5{e:N4{d:N3{c:N2{b:N1{a:1}}}}}}};
    }
}