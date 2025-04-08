struct LongFields {
    a: Int; b: Bool; c: String; d: Int?; e: Bool; f: String;
    g: Int; h: Bool; i: String; j: Int?; k: Bool; l: String;
    m: Int; n: Bool; o: String; p: Int?; q: Bool; r: String;
}

contract LongFieldsTest {
    data: LongFields;

    init() {
        self.data = LongFields{
            a:1, b:true, c:"c", d:null, e:false, f:"f",
            g:2, h:true, i:"i", j:null, k:false,l:"l",
            m:3,n:true, o:"o", p:null, q:false, r:"r"
        };
    }
}