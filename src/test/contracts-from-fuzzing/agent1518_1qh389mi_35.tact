struct ManyOptionalElements {
    a: Int?; b:Int?; c:Int?; d:Int?; e:Int?;
    f:Int?; g:Int?; h:Int?; i:Int?; j:Int?;
    k:Int?; l:Int?; m:Int?; n:Int?; o:Int?;
    p:Int?; q:Int?; r:Int?; s:Int?; t:Int?;
}

contract ManyOptElems {
    data: ManyOptionalElements;

    init() {
        self.data = ManyOptionalElements{
            a:null,b:1,c:null,d:2,e:null,
            f:3,g:null,h:4,i:null,j:5,
            k:null,l:6,m:null,n:7,o:null,
            p:8,q:null,r:9,s:null,t:10
        };
    }
}