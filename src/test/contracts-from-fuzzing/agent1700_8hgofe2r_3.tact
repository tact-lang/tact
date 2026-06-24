struct DeepNested {
    x: Int;
    y: Bool;
}

struct Middle {
    inner: DeepNested;
    flag: Bool;
}

struct Top {
    m: Middle;
    text: String;
}

contract TestContract {
    topfield: Top;

    init() {
        self.topfield = Top{
            m: Middle{ inner: DeepNested{ x:123, y:true }, flag:false },
            text: "hello"
        };
    }
}