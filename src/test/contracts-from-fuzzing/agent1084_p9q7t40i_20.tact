struct LargeNested {
    n1: Inner1;
    n2: Inner2;
    n3: Inner3;
}

struct Inner1 {
    x: Int = 1;
    y: Bool = true;
}

struct Inner2 {
    a: String = "hello";
    b: Int?;
}

struct Inner3 {
    addr: Address;
    s: String?;
}

contract TestContract {
    complex: LargeNested;
    init() {
        self.complex = LargeNested{
            n1: Inner1{},
            n2: Inner2{},
            n3: Inner3{ addr: myAddress() }
        };
    }
    receive() {}
}