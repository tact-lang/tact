struct ListA {
    x1: Int; x2: Int; x3: Int; x4: Int; x5: Int;
    x6: Int; x7: Int; x8: Int; x9: Int; x10: Int;
}

struct ListB {
    y1: Bool; y2: Bool; y3: Bool; y4: Bool; y5: Bool;
    y6: Bool; y7: Bool; y8: Bool; y9: Bool; y10: Bool;
}

struct ListC {
    z1: String; z2: String; z3: String; z4: String; z5: String;
    z6: String; z7: String; z8: String; z9: String; z10: String;
}

contract ListsContract {
    a: ListA;
    b: ListB;
    c: ListC;

    init() {
        self.a = ListA{
            x1:1,x2:2,x3:3,x4:4,x5:5,x6:6,x7:7,x8:8,x9:9,x10:10
        };
        self.b = ListB{
            y1:true,y2:false,y3:true,y4:false,y5:true,y6:false,y7:true,y8:false,y9:true,y10:false
        };
        self.c = ListC{
            z1:"a",z2:"b",z3:"c",z4:"d",z5:"e",z6:"f",z7:"g",z8:"h",z9:"i",z10:"j"
        };
    }
}