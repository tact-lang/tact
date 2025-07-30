struct LargeNested {
    a:Int;
    b:Bool;
    c:String;
    d:Int?;
}

struct Top {
    x:LargeNested;
    y:LargeNested;
}

contract MultipleNestedSame {
    data:Top;

    init() {
        self.data = Top{
            x: LargeNested{a:1, b:true, c:"X", d:null},
            y: LargeNested{a:2, b:false, c:"Y", d:42}
        };
    }
}
