struct InnerFlag {
    val: Int?;
    flag: Bool;
}

struct Wrapper {
    inner: InnerFlag?;
}

contract OptInOpt {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            inner: InnerFlag{val:null,flag:true}
        };
    }
}