struct Sub1 {
    f1: Bool;
}

struct Sub2 {
    f2: Int;
}

struct Mix {
    s1: Sub1;
    s2: Sub2;
    sopt: Sub2?;
}

contract MixedStructNested {
    data: Mix;

    init() {
        self.data = Mix{
            s1: Sub1{f1:true},
            s2: Sub2{f2:42},
            sopt: null
        };
    }
}