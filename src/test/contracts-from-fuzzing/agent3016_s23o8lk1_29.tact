struct WideStruct {
    a: Int; b: Int; c: Int; d: Int; e: Int;
    f: Bool; g: Bool; h: Bool; i: Bool; j: Bool;
    k: String; l: String; m: String;
    n: Int?; o: Bool?; p: String?;
}

contract TestContract {
    d: WideStruct;

    init() {
        self.d = WideStruct{
            a:1, b:2, c:3, d:4, e:5,
            f:true, g:false, h:true, i:false, j:true,
            k:"a", l:"b", m:"c",
            n:null, o:null, p:null
        };
    }
}