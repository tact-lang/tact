struct DeepNest3 {
    flag: Bool;
    s: String;
}

struct DeepNest2 {
    index: Int;
    nest3: DeepNest3;
}

struct DeepNest1 {
    id: Int;
    nest2: DeepNest2;
}

contract TestContract {
    data: DeepNest1;

    init() {
        self.data = DeepNest1{
            id: 42,
            nest2: DeepNest2{
                index: 3,
                nest3: DeepNest3{
                    flag: false,
                    s: "deep"
                }
            }
        };
    }
}