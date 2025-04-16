struct Mixed {
    i: Int;
    b: Bool;
    s: String;
    o: Int?;
}

contract MixedTypes {
    val: Mixed;

    init() {
        self.val = Mixed{ i:1, b:false, s:"test", o:null };
    }
}
