struct Topmost {
    a: Int;
    bb: Mid;
}

struct Mid {
    c: Int;
    dd: Bottom;
}

struct Bottom {
    e: Int;
}

contract MultiLink {
    data: Topmost;

    init() {
        self.data = Topmost{
            a:1,
            bb: Mid{
                c:2,
                dd: Bottom{ e:3 }
            }
        };
    }
}