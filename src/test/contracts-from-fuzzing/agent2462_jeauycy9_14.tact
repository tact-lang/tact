struct OptionDepth {
    a: Int?;
    b: Bool?;
    c: String;
}

struct Container {
    inner: OptionDepth;
    extra: Bool;
}

contract V {
    data: Container;
    init() {
        self.data = Container{
            inner: OptionDepth{a:null,b:true,c:"hi"},
            extra: false
        };
    }
}