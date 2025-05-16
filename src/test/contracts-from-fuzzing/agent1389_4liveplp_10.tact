struct TestS {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
}

contract ManyStructFields {
    s1: TestS;
    s2: TestS;
    s3: TestS;
    s4: TestS;
    s5: TestS;

    init() {
        let s: TestS = TestS{a:1,b:true,c:"hi",d:myAddress(),e:emptyCell()};
        self.s1 = s;
        self.s2 = s;
        self.s3 = s;
        self.s4 = s;
        self.s5 = s;
    }
}