struct Inner10 {
    a0: Int;
    a1: Int?;
    a2: Bool;
    a3: Bool?;
    a4: String;
    a5: String?;
    a6: Int;
    a7: Int?;
    a8: Bool;
    a9: String?;
}

struct Outer5 {
    i0: Inner10;
    i1: Inner10;
    i2: Inner10;
    i3: Inner10;
    i4: Inner10;
}

contract BigStruct {
    val: Outer5;

    init() {
        self.val = Outer5{
            i0: Inner10{a0:1,a1:2,a2:true,a3:null,a4:"a",a5:null,a6:3,a7:4,a8:false,a9:"x"},
            i1: Inner10{a0:1,a1:null,a2:true,a3:true,a4:"b",a5:null,a6:3,a7:null,a8:false,a9:null},
            i2: Inner10{a0:1,a1:2,a2:false,a3:false,a4:"c",a5:"d",a6:3,a7:4,a8:true,a9:"y"},
            i3: Inner10{a0:5,a1:null,a2:true,a3:null,a4:"e",a5:"f",a6:6,a7:null,a8:true,a9:"z"},
            i4: Inner10{a0:7,a1:8,a2:false,a3:true,a4:"g",a5:null,a6:9,a7:10,a8:false,a9:null},
        };
    }
}
