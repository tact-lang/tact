struct LongOne {
    a1:Int; a2:Bool; a3:Int?; a4:Bool?; a5:String; a6:String?; a7:Cell; a8:Cell?; a9:Slice; a10:Slice?;
    b1:Int; b2:Bool; b3:Int?; b4:Bool?; b5:String; b6:String?; b7:Cell; b8:Cell?; b9:Slice; b10:Slice?;
    c1:Int; c2:Bool; c3:Int?; c4:Bool?; c5:String; c6:String?; c7:Cell; c8:Cell?; c9:Slice; c10:Slice?;
}

contract TestContract {
    big: LongOne;

    init() {
        self.big = LongOne{
            a1:1,a2:true,a3:null,a4:null,a5:"a",a6:null,a7:emptyCell(),a8:null,a9:emptyCell().asSlice(),a10:null,
            b1:2,b2:false,b3:null,b4:null,b5:"b",b6:null,b7:emptyCell(),b8:null,b9:emptyCell().asSlice(),b10:null,
            c1:3,c2:true,c3:null,c4:null,c5:"c",c6:null,c7:emptyCell(),c8:null,c9:emptyCell().asSlice(),c10:null
        };
    }
}