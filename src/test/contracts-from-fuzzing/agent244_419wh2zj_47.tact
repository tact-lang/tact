// Very deeply nested with optional and null assignment before leaf
struct X4 {
    val: Int;
}

struct X3 {
    inner: X4?;
}

struct X2 {
    inner: X3?;
}

struct X1 {
    inner: X2?;
}

contract DeepChainBeforeLeafNull {
    data: X1;

    init() {
        self.data = X1{
            inner: X2{
                inner: null
            }
        };
    }
}