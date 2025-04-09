struct S1 {
    val: Int;
    inner: S2;
}

struct S2 {
    val: Bool;
    inner: S3;
}

struct S3 {
    val: String;
    inner: S4;
}

struct S4 {
    val: Address;
}

contract DeepChain {
    data: S1;

    init() {
        self.data = S1{
            val:1,
            inner:S2{
                val:true,
                inner:S3{
                    val:"test",
                    inner:S4{val:myAddress()}
                }
            }
        };
    }
}