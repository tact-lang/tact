struct Mix1 { a: Int; b: Int?; c: Bool; d: String?; }
struct Mix2 { e: String; f: Address; g: Bool?; h: Int; }

contract MixedFieldsContract {
    m1: Mix1;
    m2: Mix2;

    init() {
        self.m1 = Mix1 { a:1, b:null, c:true, d:"x" };
        self.m2 = Mix2 { e:"y", f:myAddress(), g:false, h:42 };
    }
}