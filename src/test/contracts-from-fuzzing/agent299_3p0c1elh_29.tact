struct Outer1 { s: String }
struct Outer2 { s: Outer1 }
struct Outer3 { s: Outer2 }
struct Outer4 { s: Outer3 }

contract DeepStringNest4 {
    d: Outer4;
    init() {
        self.d=Outer4{s:Outer3{s:Outer2{s:Outer1{s:"str"}}}};
    }
}