struct S1 { val: Int }
struct S2 { val: S1 }
struct S3 { val: S2 }
struct S4 { val: S3 }

contract DeepChain {
    data: S4;
    init() {
        self.data = S4{val: S3{val: S2{val: S1{val: 42}}}};
    }
}