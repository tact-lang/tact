struct Ctx {
    s:String;
    n:Int;
}

struct Bin {
    first:Ctx;
    second:Ctx;
}

contract BigNested {
    big:Bin;

    init() {
        self.big = Bin{
            first:Ctx{ s:"hey", n:33 },
            second:Ctx{ s:"ho", n:44 }
        };
    }
}