struct ManyOptionals {
   a: Int?; b: Int?; c: Bool?; d: Bool?;
   e: Int?; f: Int?; g: Bool?; h: Bool?;
   i: Int?; j: Int?; k: Bool?; l: Bool?;
}

contract OptsContract {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            a:null, b:null, c:null, d:null,
            e:null, f:null, g:null, h:null,
            i:null, j:null, k:null, l:null
        };
    }
}
