struct GrandChild {
    note: String;
    number: Int;
}

struct Child {
    g: GrandChild;
    flag: Bool;
}

struct Parent {
    c: Child;
    address: Address;
}

contract TestContract {
    p: Parent;

    init() {
        self.p = Parent{
            c: Child{
                g: GrandChild{
                    note: "deeply",
                    number: 123,
                },
                flag: true,
            },
            address: myAddress(),
        };
    }
}