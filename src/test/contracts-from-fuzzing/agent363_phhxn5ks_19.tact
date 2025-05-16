struct Inner {
    val: Int;
    opt: Int?;
}
struct Mid {
    s: Inner;
    sopt: Inner?;
}
struct Top {
    m: Mid;
    mopt: Mid?;
}

contract TestContract {
    data: Top;

    init() {
        self.data = Top{
            m: Mid{
                s: Inner{val:1,opt:null},
                sopt: null
            },
            mopt: null
        };
    }

    receive() {}
}