// Deep optional chain in nested structs, field inside field is optional
struct S3 { val: Int? }
struct S2 { s3: S3? }
struct S1 { s2: S2? }

contract ChainOpt {
    chain: S1;

    init() {
        self.chain = S1{
            s2: S2{
                s3: S3{
                    val: null
                }
            }
        };
    }
}