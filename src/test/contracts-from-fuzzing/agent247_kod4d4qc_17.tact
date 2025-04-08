struct Wrap {
    inner: Inner;
}

struct Inner {
    val: Int;
    data: Deep;
}

struct Deep {
    info: Leaf;
}

struct Leaf {
    str: String;
    flag: Bool;
}

contract VeryDeep {
    wrap: Wrap;
    init() {
        self.wrap = Wrap{
            inner: Inner{
                val: 10,
                data: Deep{
                    info: Leaf{ str:"hello", flag:true }
                }
            }
        };
    }
}