struct Deep1 { a: Int; }
struct Deep2 { next: Deep1; }
struct Deep3 { next: Deep2; }
struct Deep4 { next: Deep3; }
struct Deep5 { next: Deep4; }

contract DeepChain {
    x: Deep5;
    init() {
        self.x = Deep5{next: Deep4{next: Deep3{next: Deep2{next: Deep1{a: 42}}}}};
    }
}