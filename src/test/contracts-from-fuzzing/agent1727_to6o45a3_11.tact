// persistent struct with many optionals, nested struct also with optionals
struct SOpt {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract NestedOptionals {
    data: SOpt?;
    
    init() {
        self.data = SOpt{
            a: 99,
            b: false,
            s: "abc",
        };
    }

    receive() {
        self.data = null;
    }
}