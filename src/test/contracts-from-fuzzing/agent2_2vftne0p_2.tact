struct DeepNest1 {
    num: Int;
    flag: Bool;
}

struct DeepNest2 {
    nest1: DeepNest1;
    val: Int;
}

struct DeepNest3 {
    nest2: DeepNest2;
    extra: Int;
}

contract TestContract {
    deepData: DeepNest3;

    init() {
        self.deepData = DeepNest3{
            nest2: DeepNest2{
                nest1: DeepNest1{ num: 7, flag: false },
                val: 42,
            },
            extra: 99,
        };
    }
}