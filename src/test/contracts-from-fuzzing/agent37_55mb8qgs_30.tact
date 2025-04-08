struct TestS {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
}

contract PermTest {
    s: TestS;

    init() {
        self.s = TestS{
            a:1,b:true,c:"x",d:myAddress(),e:emptyCell()
        };
    }
}
