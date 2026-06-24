struct Wide {
    a: Int; b: Int; c: Int; d: Int; e: Int;
    f: Bool; g: Bool; h: Bool; i: Bool; j: Bool;
    s1: String; s2: String; s3: String; s4: String; s5: String;
}

contract WideStructContract {
    data: Wide;

    init() {
        self.data = Wide{
            a:1,b:2,c:3,d:4,e:5,
            f:true,g:false,h:true,i:false,j:true,
            s1:"a",s2:"b",s3:"c",s4:"d",s5:"e",
        };
    }
}