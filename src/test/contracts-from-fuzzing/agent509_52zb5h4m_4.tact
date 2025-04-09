struct A {
    x: Int;
}

struct B {
    y: Bool;
}

struct Combo {
    a: A;
    b: B;
    flag: Bool;
    note: String;
    optS: String?;
}

contract ComboFields {
    data: Combo;

    init() {
        self.data = Combo{
            a: A{x:1},
            b: B{y:true},
            flag: false,
            note: "ok",
            optS: null
        };
    }
}