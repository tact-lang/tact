struct ManyFields {
    a: Int;  b: Int;  c: Int;  d: Int;  e: Int;
    f: Int;  g: Int;  h: Int;  i: Int;  j: Int;
    k: Bool; l: Bool; m: Bool; n: Bool; o: Bool;
    p: String; q: String; r: String; s: String; t: String;
}

contract TestContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a:1,b:2,c:3,d:4,e:5,
            f:6,g:7,h:8,i:9,j:10,
            k:true,l:false,m:true,n:false,o:true,
            p:"a",q:"b",r:"c",s:"d",t:"e"
        };
    }
}