struct Mixed {
    i: Int;
    s: String;
    o: Int?;
}

contract MultiFields {
    val1: Mixed;
    val2: Mixed;

    init() {
        self.val1 = Mixed{i:1, s:"one", o:null};
        self.val2 = Mixed{i:2, s:"two", o:2};
    }
}