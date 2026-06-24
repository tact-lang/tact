struct Nest {
    x:Int;
    y:Int;
}

contract InlineDeepStruct {
    s:Nest = Nest{x:1,y:2};
    init() {
        self.s = Nest{x:3,y:4};
    }
}