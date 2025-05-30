// Deep nested mixed optional chain filled with non-nulls
struct OS {
    a: Int?;
}

struct W1 {
    inner: OS?;
}

struct W2 {
    wrap1: W1?;
}

contract Test {
    w2: W2 = W2{
        wrap1: W1{
            inner: OS{
                a: 555
            }
        }
    };

    init() {}
}