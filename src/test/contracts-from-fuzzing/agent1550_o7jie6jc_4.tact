struct SomeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
}

contract ManyFieldsContract {
    sf: SomeStruct;
    s1: String;
    s2: String;
    s3: String;
    b1: Bool;
    b2: Bool;
    i1: Int;
    i2: Int;
    init() {
        self.sf = SomeStruct{
            a: 1,
            b: true,
            c: "hi",
            d: emptyCell(),
        };
        self.s1 = "one";
        self.s2 = "two";
        self.s3 = "three";
        self.b1 = true;
        self.b2 = false;
        self.i1 = 10;
        self.i2 = 20;
    }
}