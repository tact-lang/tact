struct HugeStruct {
    a: Int; b: Int; c: Int; d: Int; e: Int;
    f: Bool; g: Bool; h: Bool; i: Bool; j: Bool;
    k: String; l: String; m: String; n: String; o: String;
}

contract HugeTest {
    data: HugeStruct;

    init() {
        self.data = HugeStruct{
            a:1,b:2,c:3,d:4,e:5,
            f:true,g:false,h:true,i:false,j:true,
            k:"a",l:"b",m:"c",n:"d",o:"e"
        };
    }
}
