struct MultiLevel {
    a: Int;
    b: Int?;
    c: Int;
    d: Int?;
}

contract MixedOptionals {
    val: MultiLevel;

    init() {
        self.val = MultiLevel{a:1,b:null,c:2,d:null};
    }
}