struct BigOne { a: Int; b: Bool; c: String; d: Int?; e: Bool?; f: String?; }

contract Test {
    big: BigOne;

    init() {
        self.big = BigOne{ a:1, b:true, c:"x", d:null, e:null, f:null };
    }
}