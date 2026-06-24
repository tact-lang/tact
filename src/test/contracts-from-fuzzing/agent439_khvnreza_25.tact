struct LargeNest1 { a: Int; b: LargeNest2 }
struct LargeNest2 { c: Int; d: LargeNest3 }
struct LargeNest3 { e: Int; f: LargeNest4 }
struct LargeNest4 { g: Int; h: LargeNest5 }
struct LargeNest5 { i: Int; j: String }

contract Test25 {
    var: LargeNest1;

    init() {
        self.var = LargeNest1{
            a: 1,
            b: LargeNest2{
                c: 2,
                d: LargeNest3{
                    e: 3,
                    f: LargeNest4{
                        g: 4,
                        h: LargeNest5{
                            i: 5,
                            j: "done",
                        }
                    }
                }
            }
        };
    }

    receive() {}
}