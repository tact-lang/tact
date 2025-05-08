struct S1 { 
    a: Int; 
} 
struct S2 { 
    inner: S1; 
} 
struct S3 { 
    inner2: S2; 
} 
contract ChainStructs { 
    val: S3; 
    init() { 
        self.val = S3{ inner2: S2{ inner: S1{ a: 5 } } }; 
    } 
}