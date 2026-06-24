struct Deep1 {
    f1: Int;
}

struct Deep2 {
    inner: Deep1;
}

struct Deep3 {
    inner: Deep2;
}

struct Deep4 {
    inner: Deep3;
}

contract Test {
    val: Deep4 = Deep4{
        inner: Deep3{
            inner: Deep2{
                inner: Deep1{f1: 42},
            },
        },
    };
}