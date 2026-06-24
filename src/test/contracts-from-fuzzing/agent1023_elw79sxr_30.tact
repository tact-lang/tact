struct Various {
    i:Int; b:Bool; s:String; a:Address; c:Cell; sl:Slice;
    io:Int?; bo:Bool?; so:String?; ao:Address?; co:Cell?; slo:Slice?;
}

contract VariantsContract {
    val: Various;

    init() {
        self.val = Various{
            i:1, b:true, s:"hi", a:myAddress(), c:emptyCell(), sl:emptyCell().asSlice(),
            io:null, bo:null, so:null, ao:null, co:null, slo:null
        };
    }
}