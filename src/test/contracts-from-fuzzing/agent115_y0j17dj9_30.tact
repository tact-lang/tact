struct LargeSparse {
    a: Int?; b: Int?; c: Int?; d: Int?; e: Int?; f: Int?;
    g: String?; h: String?; i: String?;
    j: Bool?; k: Bool?; l: Bool?;
}

contract SparseFields {
    large: LargeSparse;
    init() {
        self.large = LargeSparse{
            a:null, b:null, c:null, d:null, e:null, f:null,
            g:null,h:null,i:null,j:null,k:null,l:null
        };
    }
}