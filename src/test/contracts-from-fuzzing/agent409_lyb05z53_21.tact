struct SBig1 { a: Int; b: Int } 
struct SBig2 { s: SBig1; c: Int } 
struct SBig3 { s: SBig2; d: Int }

contract Multilayer {
    data: SBig3;

    init() {
        self.data = SBig3{
            s: SBig2{
                s: SBig1{
                    a: 10,
                    b: 20
                },
                c: 30
            },
            d: 40
        };
    }
}