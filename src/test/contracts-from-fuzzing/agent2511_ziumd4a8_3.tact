struct DeepNest3 {
    leaf: String;
}

struct DeepNest2 {
    next: DeepNest3;
    value: Int;
}

struct DeepNest1 {
    next: DeepNest2;
    flag: Bool;
}

contract DeepContract {
    data: DeepNest1;

    init() {
        self.data = DeepNest1{
            next: DeepNest2{
                next: DeepNest3{
                    leaf: "bottom"
                },
                value: 456
            },
            flag: false
        };
    }
}