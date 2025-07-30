struct Sub1 {
    a: Int;
    b: Bool;
}

struct Sub2 {
    c: String;
    d: Address;
}

struct Top {
    first: Sub1;
    second: Sub2;
}

contract MultipleNested {
    top: Top;

    init() {
        self.top = Top{
            first: Sub1{a:1,b:true},
            second: Sub2{c:"abc", d: myAddress()}
        };
    }
}