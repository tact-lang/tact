struct S {
    a: Int; b: Bool; c: Int?; d: Bool?; e: Int; f: Bool; g: Int?; h: Bool?;
    i: Int; j: Bool; k: Int?; l: Bool?; m: Int; n: Bool; o: Int?; p: Bool?;
}

contract LargeStructStorage {
    store: S;

    init() {
        self.store = S{
          a:1, b:true, c:2, d:null, e:3, f:false, g:null, h:true,
          i:4, j:true, k:5, l:null, m:6, n:false, o:null, p:true
        };
    }
}
