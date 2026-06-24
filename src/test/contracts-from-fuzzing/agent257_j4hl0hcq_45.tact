struct Rec1 {
    inner: Rec2;
}

struct Rec2 {
    inner: Rec3;
}

struct Rec3 {
    inner: Rec4;
}

struct Rec4 {
    inner: Rec5;
}

struct Rec5 {
    inner: Rec6;
}

struct Rec6 {
    leaf: Int;
}

contract Recursion {
    r: Rec1 = Rec1{
        inner: Rec2{
            inner: Rec3{
                inner: Rec4{
                    inner: Rec5{
                        inner: Rec6{
                            leaf: 777,
                        },
                    },
                },
            },
        },
    };
}