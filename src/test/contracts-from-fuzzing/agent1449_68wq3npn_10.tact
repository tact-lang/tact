struct Outer {
    inner1: Inner;
    inner2: Inner;
    inner3: Inner;
}

struct Inner {
    flag: Bool;
    value: Int?;
    note: String?;
    nested: Leaf?;
}

struct Leaf {
    text: String;
}

contract MultiLayerOptional {
    root: Outer = Outer{
        inner1: Inner{ flag:true, value:null, note:null, nested:null },
        inner2: Inner{ flag:false, value:42, note:"foo", nested:null },
        inner3: Inner{ flag:true, value:null, note:null, nested:null }
    };

    init() {
        self.root = Outer{
            inner1: Inner{ flag:true, value:1, note:"a", nested:Leaf{text:"hello"} },
            inner2: Inner{ flag:false, value:2, note:"b", nested:Leaf{text:"world"} },
            inner3: Inner{ flag:true, value:3, note:"c", nested:Leaf{text:"!"} }
        };
    }
}
