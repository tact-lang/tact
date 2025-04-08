struct SLev3 { a: Int }
struct SLev2 { a: Int; n3: SLev3 }
struct SLev1 { a: Int; n2: SLev2 }

contract InterleavedNesting {
    data: SLev1;

    init() {
        self.data = SLev1{
            a:1,
            n2:SLev2{
                a:2,
                n3:SLev3{a:3}
            }
        };
    }
}