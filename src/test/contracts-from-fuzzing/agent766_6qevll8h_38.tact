struct Huge {
    a1: Int; a2: Int?; a3: Bool; a4: Bool?; a5: String;
    a6: String?; a7: Int; a8: Int?; a9: Bool; a10: Bool?;
    b1: Inner; b2: Inner?; b3: Inner; b4: Inner?; b5: Inner;
    b6: Inner?; b7: Inner; b8: Inner?; b9: Inner; b10: Inner?;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract BigTest {
    data: Huge;

    init() {
        self.data = Huge{
            a1:1,a2:null,a3:true,a4:null,a5:"a",
            a6:null,a7:2,a8:null,a9:false,a10:true,
            b1:Inner{x:1,y:true},
            b2:null,
            b3:Inner{x:2,y:false},
            b4:null,
            b5:Inner{x:3,y:true},
            b6:null,
            b7:Inner{x:4,y:false},
            b8:null,
            b9:Inner{x:5,y:true},
            b10:null
        };
    }
}