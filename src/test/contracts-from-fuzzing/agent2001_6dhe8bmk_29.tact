struct LargeSparse {
    a:Int?; b:Int?; c:Int?; d:Int?; e:Int?;
    f:Int?; g:Int?; h:Int?; i:Int?; j:Int?;
}

contract LargeSparseContract {
    s: LargeSparse;

    init() {
        self.s = LargeSparse{
            a:null,b:null,c:null,d:null,e:null,
            f:null,g:null,h:null,i:null,j:null,
        };
    }
}