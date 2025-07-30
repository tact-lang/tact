struct LargeNested {
    a:Int; b:Int?; c:Bool; d:Int;
    e:String; f:Cell; g:Bool?;
    h:Int; i:String?; j:Address;
}

contract LargeNestedStruct {
    complex: LargeNested;

    init() {
        self.complex = LargeNested{
            a:1, b:null, c:true, d:4, e:"e", f:emptyCell(),
            g:null, h:8, i:"str", j:myAddress()
        };
    }
}
