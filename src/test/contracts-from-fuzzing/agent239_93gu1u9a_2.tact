struct DeepNest1 {
    n: Int;
    opt: String?;
}

struct DeepNest2 {
    nest1: DeepNest1;
    flag: Bool;
}

struct DeepNest3 {
    nest2: DeepNest2;
    info: String;
    val: Int?;
}

contract TestDeepNest {
    deepData: DeepNest3;

    init() {
        self.deepData = DeepNest3{
            nest2: DeepNest2{
                nest1: DeepNest1{n: 42, opt: "hi"},
                flag: true,
            },
            info: "data",
            val: null,
        };
    }
}