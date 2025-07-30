struct Container {
    inner1: Inner;
    inner2: Inner;
}

struct Inner {
    flag: Bool;
    num: Int;
    text: String;
}

contract WideStructStorage {
    data: Container;

    init() {
        self.data = Container{
            inner1: Inner{ flag:true, num:1, text:"a" },
            inner2: Inner{ flag:false, num:2, text:"b" }
        };
    }
}
