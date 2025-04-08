struct Inner {
    flag: Bool;
    note: String;
}

struct Middle {
    important: Inner;
}

struct Outer {
    m: Middle;
}

contract Compose {
    data: Outer;

    init() {
        self.data = Outer{ m: Middle{ important: Inner{ flag:true, note:"hi" } } };
    }
}