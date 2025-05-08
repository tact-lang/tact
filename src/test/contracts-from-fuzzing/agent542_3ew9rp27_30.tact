struct S1 {
    s: String = "default";
}

struct Holder {
    x: Int = 100;
    s1: S1;
}

contract TestContract {
    data: Holder;

    init() {
        self.data = Holder{
            s1: S1{}
        };
    }
}