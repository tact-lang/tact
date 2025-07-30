struct DeepLong {
    a: Int;
    b: Bool; 
    c: String; 
    d: Address; 
    e: Int?; 
    f: Bool?; 
    g: String?; 
    h: Address?; 
    i: Int; 
    j: Bool; 
    k: String; 
    l: Address; 
    m: Int?; 
    n: Bool?; 
    o: String?; 
    p: Address?; 
}

contract TestContract {
    field: DeepLong;

    init() {
        self.field = DeepLong{
            a:1,b:true,c:"",d:myAddress(),
            e:null,f:null,g:null,h:null,
            i:2,j:false,k:"hello",l:myAddress(),
            m:null,n:null,o:null,p:null
        };
    }
}