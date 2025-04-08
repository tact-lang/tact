struct Sub1 {
    val: Int;
}

struct Sub2 {
    foo: Bool;
}

struct Mix {
    p: Sub1;
    q: Sub2;
    flag: Bool;
}

contract TestContract {
    mixed: Mix;

    init() {
        self.mixed = Mix{
            p: Sub1{val:5},
            q: Sub2{foo:true},
            flag: false
        };
    }
}