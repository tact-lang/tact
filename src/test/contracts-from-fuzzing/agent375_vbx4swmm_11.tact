struct Child {
    s: String?;
    i: Int?;
    b: Bool?;
}

struct Parent {
    c1: Child?;
    c2: Child?;
    flag: Bool?;
    note: String?;
    count: Int?;
}

contract TestContract {
    data: Parent;

    init() {
        self.data = Parent{
            c1: Child{ s:"A", i:1, b:true },
            c2: null,
            flag: null,
            note: "hello",
            count: null,
        };
    }

    receive() {
        let _ = self.data;
    }
}