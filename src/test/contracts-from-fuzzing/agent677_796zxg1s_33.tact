struct Inner {
    val: Int as coins;
    flag: Bool;
}

struct Outer {
    inner: Inner;
    opt: Int?;
}

contract SerNestOpt {
    state: Outer;
    init() {
        self.state = Outer{ inner: Inner{ val:10, flag:true }, opt:null };
    }
}