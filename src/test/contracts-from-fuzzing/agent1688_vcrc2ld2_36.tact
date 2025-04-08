struct Sub1 { val: Int; }

struct Sub2 { text: String; }

struct Holder {
    s1: Sub1?;
    s2: Sub2;
}

contract TestContract {
    data: Holder;

    init() {
        self.data = Holder{
            s1: null,
            s2: Sub2{text: "hello"}
        };
    }
}