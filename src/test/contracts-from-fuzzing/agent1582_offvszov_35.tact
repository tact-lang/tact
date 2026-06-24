struct S1 { i: Int } 
struct S2 { s: S1 } 
struct S3 { s: S2 } 

contract ChainStructs {
    chain: S3 = S3 {
        s: S2 {
            s: S1 {
                i: 42
            }
        }
    };
    receive() {}
}