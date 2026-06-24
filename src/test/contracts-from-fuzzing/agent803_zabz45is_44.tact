struct Bottom {
    v: Int;
}

struct Mid {
    a: Int;
    b: Bottom;
}

struct Top {
    m: Mid;
    flag: Bool;
}

contract TopContract {
    data: Top;
    init() {
        self.data = Top{
            m: Mid{ a:7, b: Bottom{v:42}},
            flag:true
        };
    }
}