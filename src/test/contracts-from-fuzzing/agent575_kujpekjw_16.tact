struct TestS {
    foo: Int;
    bar: Bool;
}

contract PunningAssign {
    data: TestS;

    init() {
        let foo = 5;
        let bar = true;
        self.data = TestS{ foo, bar };
    }
}