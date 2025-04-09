struct Mixed {
    i: Int;
    s: String;
    b: Bool;
}

contract MixedArray {
    item1: Mixed;
    item2: Mixed;
    item3: Mixed;

    init() {
        self.item1 = Mixed{ i:1, s:"a", b:true };
        self.item2 = Mixed{ i:2, s:"b", b:false };
        self.item3 = Mixed{ i:3, s:"c", b:true };
    }
}