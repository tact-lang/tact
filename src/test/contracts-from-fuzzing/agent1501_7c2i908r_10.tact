struct Simple {
    a: Int;
    b: Bool;
}

contract TestContract {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Simple;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = "abc";
        self.f4 = myAddress();
        self.f5 = Simple{ a: 5, b: false };
    }
}