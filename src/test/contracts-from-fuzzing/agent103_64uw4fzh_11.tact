struct ManyOptionals {
    a: Int?; b: Int?; c: Int?; d: Int?;
    e: String?; f: Bool?; g: Bool?; h: String?;
    i: Int?; j: Int?; k: Int?; l: Bool?;
}

contract TestContract {
    many: ManyOptionals;

    init() {
        self.many = ManyOptionals{
            a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null,i:null,j:null,k:null,l:null
        };
    }
}
