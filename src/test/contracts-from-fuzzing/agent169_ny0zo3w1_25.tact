struct DeepWithOptionals {
    sub1: Sub1?;
}

struct Sub1 {
    sub2: Sub2?;
}

struct Sub2 {
    v: Int?;
}

contract TestContract {
    dwo: DeepWithOptionals;
    init() {
        self.dwo = DeepWithOptionals{ sub1: null };
    }
}