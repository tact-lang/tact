struct ManyFields {
    a: Int; b: Bool; c: String; d: Int?; e: Bool; f: String; g: Int; h: Bool; i: String; j: Int?;
    k: Int; l: Bool; m: String; n: Int?; o: Bool; p: String; q: Int; r: Bool; s: String; t: Int?;
}

contract ManyFieldsContract {
    data: ManyFields;
    init() {
        self.data = ManyFields{
            a:1, b:true, c:"c", d:null, e:false, f:"f", g:7, h:true, i:"i", j:null,
            k:2, l:false, m:"m", n:null, o:true, p:"p", q:8, r:false, s:"s", t:null
        };
    }
}