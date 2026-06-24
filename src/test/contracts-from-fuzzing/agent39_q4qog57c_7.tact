struct Mixed {
    i: Int;
    b: Bool;
    a: Address;
    s: String;
}

contract TestContract {
    m: Mixed;

    init() {
        self.m = Mixed{
            i:42,
            b:true,
            a: myAddress(),
            s: "hello"
        };
    }
}