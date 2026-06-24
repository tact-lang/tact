struct A {
    x: Int;
}

struct B {
    y: Int;
}

contract ManyTypes {
    a: A;
    b: B;
    addr: Address;
    flag: Bool;
    str: String;

    init() {
        self.a = A{ x:10 };
        self.b = B{ y:20 };
        self.addr = myAddress();
        self.flag = true;
        self.str = "hello";
    }
}