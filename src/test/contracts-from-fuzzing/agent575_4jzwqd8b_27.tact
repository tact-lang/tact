struct Composite {
    nested1: Sub1;
    nested2: Sub2;
}

struct Sub1 {
    a: Int;
    b: Bool;
}

struct Sub2 {
    c: String;
    d: Bool?;
}

contract TestContract {
    comp: Composite;

    init() {
        self.comp = Composite{
            nested1: Sub1{ a:1, b:true },
            nested2: Sub2{ c:"ok", d:null }
        };
    }
}
