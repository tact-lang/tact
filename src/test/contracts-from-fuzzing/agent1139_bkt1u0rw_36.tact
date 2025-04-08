// deeply nested optionals in several layers
struct S1 {
    inner: S2?;
}
struct S2 {
    inner: S3?;
}
struct S3 {
    inner: S4?;
}
struct S4 {
    a: Int;
}

contract DeepChainOfOpts {
    val: S1?;
    
    init() {
        self.val = null;
    }
}