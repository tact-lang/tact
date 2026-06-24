struct ManyOptional {
    a: Int?; b: Int?; c: Int?; d: Int?; e: Int?;
    f: Bool?; g: Bool?; h: Bool?; i: Bool?; j: Bool?;
}

contract TestContract {
    val: ManyOptional = ManyOptional{
        a:null,b:null,c:null,d:null,e:null,
        f:null,g:null,h:null,i:null,j:null
    };
}