struct Massive {
  a: Int; b: Int; c: Int; d: Int; e: Int; f: Int; g: Int; h: Int; i: Int; j: Int;
  k: Int; l: Int; m: Int; n: Int; o: Int; p: Int; q: Int; r: Int; s: Int; t: Int;
  u: Int?; v: Int?; w: Int?; x: Int?; y: Int?; z: Int?; aa: Int?; bb: Int?; cc: Int?; dd: Int?;
  ee: Bool; ff: Bool?; gg: Bool; hh: Bool?; ii: String; jj: String?;
}

contract TestContract {
    mass: Massive;

    init() {
        self.mass = Massive{
            a:1, b:2, c:3, d:4, e:5, f:6, g:7, h:8, i:9, j:10,
            k:11, l:12, m:13, n:14, o:15, p:16, q:17, r:18, s:19, t:20,
            u:null, v:null, w:null, x:null, y:null, z:null, aa:null, bb:null, cc:null, dd:null,
            ee:true, ff:null, gg:false, hh:null, ii:"ok", jj:null
        };
    }
}