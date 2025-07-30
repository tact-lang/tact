struct Child1 {
    a: Int;
    b: Bool;
}

struct Child2 {
    c: Int?;
    d: Bool?;
}

struct Parent {
    one: Child1;
    two: Child2;
    e: String;
    f: Address;
}

contract TestContract {
    data: Parent;

    init() {
        self.data = Parent{
            one: Child1{ a:5, b:true },
            two: Child2{ c:null, d:false },
            e: "abc",
            f: myAddress()
        };
    }
}