struct BigNested {
    a: Int;
    b: String;
    c: Bool;
    d: Int;
    e: String;
    f: Bool;
    g: Int;
    h: String;
    i: Bool;
    j: Int;
}

contract ManyComplexFields {
    val1: BigNested;
    val2: BigNested;
    val3: BigNested;

    init() {
        self.val1 = BigNested{a:1,b:"a",c:true,d:2,e:"b",f:false,g:3,h:"c",i:true,j:4};
        self.val2 = BigNested{a:5,b:"d",c:false,d:6,e:"e",f:true,g:7,h:"f",i:false,j:8};
        self.val3 = BigNested{a:9,b:"g",c:true,d:10,e:"h",f:false,g:11,h:"i",i:true,j:12};
    }
}