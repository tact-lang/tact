struct BiggerStruct {
    a: Int; b: Int; c: Int; d: Int; e: Int; f: Int; g: Int; h: Int; i: Int; j: Int;
    k: Bool; l: Bool; m: Bool; n: Bool; o: Bool; p: Bool; q: Bool; r: Bool; s: Bool; t: Bool;
    u: String; v: String; w: String; x: String; y: String;
    z: Address;
}

contract ManyFields {
    data: BiggerStruct;

    init() {
        self.data = BiggerStruct{
            a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10,
            k:true,l:true,m:false,n:true,o:false,p:true,q:false,r:true,s:false,t:true,
            u:"u",v:"v",w:"w",x:"x",y:"y",
            z: myAddress()
        };
    }
}