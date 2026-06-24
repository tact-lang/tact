struct N0 { v: Int; }
struct N1 { next: N0; }
struct N2 { next: N1; }
struct N3 { next: N2; }
struct N4 { next: N3; }
struct N5 { next: N4; }

contract Test {
    head: N5 = N5{next:N4{next:N3{next:N2{next:N1{next:N0{v:0}}}}}};
    init() {
        self.head = N5{next:N4{next:N3{next:N2{next:N1{next:N0{v:9}}}}}};
    }
}