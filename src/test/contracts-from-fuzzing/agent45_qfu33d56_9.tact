struct S0 { a: Int }
struct S1 { f: S0 }
struct S2 { f: S1 }
struct S3 { f: S2 }
struct S4 { f: S3 }
struct S5 { f: S4 }
struct S6 { f: S5 }
contract ManyNestings {
    val: S6;

    init() {
        self.val = S6{f: S5{f: S4{f: S3{f: S2{f: S1{f:S0{a:11}}}}}}};
    }
}