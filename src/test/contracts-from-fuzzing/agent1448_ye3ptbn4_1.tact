struct Simple {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
}

contract Test {
    data: Simple;
    
    init() {
        self.data = Simple{
            a: 1,
            b: true,
            c: "abc",
            d: myAddress(),
        };
    }
}