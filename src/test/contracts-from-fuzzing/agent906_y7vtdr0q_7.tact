struct Nested {
    innerInt: Int;
    innerBool: Bool;
    innerString: String?;
}

contract ListContract {
    item1: Nested;
    item2: Nested;
    item3: Nested;

    init() {
        self.item1 = Nested{ innerInt:1, innerBool:true, innerString:null };
        self.item2 = Nested{ innerInt:2, innerBool:false, innerString:null };
        self.item3 = Nested{ innerInt:3, innerBool:true, innerString:null };
    }
}