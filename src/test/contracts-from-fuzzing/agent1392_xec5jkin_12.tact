struct Mixed {
    i: Int;
    o: Int?;
    s: String;
    b: Bool?;
}

contract MixedData {
    d: Mixed;

    init() {
        self.d = Mixed{ i:42, o:null, s:"hi", b:true };
    }
}