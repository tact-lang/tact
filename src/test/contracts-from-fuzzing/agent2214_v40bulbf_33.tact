struct Middle {
    item: Int;
    text: String;
    flag: Bool;
}

struct Top {
    m1: Middle;
    m2: Middle;
    m3: Middle;
}

contract WideNested {
    data: Top;

    init() {
        self.data = Top{
            m1: Middle{item:1,text:"a",flag:true},
            m2: Middle{item:2,text:"b",flag:false},
            m3: Middle{item:3,text:"c",flag:true}
        };
    }
}