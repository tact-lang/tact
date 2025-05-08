struct RecNest1 { a: Int }
struct RecNest2 { x: RecNest1 }
struct RecNest3 { y: RecNest2 }
struct RecNest4 { z: RecNest3 }
struct RecNest5 { t: RecNest4 }

contract Test24 {
    bigDeep: RecNest5;

    init() {
        self.bigDeep = RecNest5{
            t: RecNest4{
                z: RecNest3{
                    y: RecNest2{
                        x: RecNest1{ a: 99 }
                    }
                }
            }
        };
    }
}