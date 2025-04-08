struct LongMixed {
    i1:Int; s1:String; b1:Bool; c1:Cell; sl1:Slice; a1:Address;
    i2:Int; s2:String; b2:Bool; c2:Cell; sl2:Slice; a2:Address;
}

contract LongMixedData {
    data: LongMixed;

    init() {
        self.data = LongMixed{
            i1:1, s1:"a", b1:true, c1:emptyCell(), sl1:emptyCell().asSlice(), a1:myAddress(),
            i2:2, s2:"b", b2:false, c2:emptyCell(), sl2:emptyCell().asSlice(), a2:myAddress()
        };
    }
}