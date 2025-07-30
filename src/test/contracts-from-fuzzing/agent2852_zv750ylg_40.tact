struct Test {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
}

contract DefaultsVsExplicit {
    s: Test;

    init() {
        self.s = Test{ a:5, b:true, c:"abc", d:myAddress() };
    }
}