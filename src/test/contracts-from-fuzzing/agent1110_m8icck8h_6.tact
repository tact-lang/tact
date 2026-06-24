struct L3 {
    deepVal: Int;
}

struct L2 {
    nested: L3;
    flag: Bool;
}

struct L1 {
    container: L2;
    text: String;
}

contract TestContract {
    obj: L1;

    init() {
        self.obj = L1{
            container: L2{
                nested: L3{
                    deepVal: 123,
                },
                flag: true,
            },
            text: "deep",
        };
    }
}