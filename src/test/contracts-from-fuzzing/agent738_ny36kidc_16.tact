struct SubStruct {
    a: Int;
    b: Bool;
}

contract ManyNestedFields {
    sub1: SubStruct;
    sub2: SubStruct;
    sub3: SubStruct;
    sub4: SubStruct;
    sub5: SubStruct;

    init() {
        let x = SubStruct{ a: 123, b: true };
        self.sub1 = x;
        self.sub2 = x;
        self.sub3 = x;
        self.sub4 = x;
        self.sub5 = x;
    }
}