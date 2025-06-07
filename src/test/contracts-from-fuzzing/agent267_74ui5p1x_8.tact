struct Layer3 {
    flag: Bool;
}

struct Layer2 {
    l3opt: Layer3?;
    str: String;
}

struct Layer1 {
    l2: Layer2;
    count: Int;
}

contract OptionDeep {
    val: Layer1;

    init() {
        self.val = Layer1{
            l2: Layer2{
                l3opt: null,
                str: "ok"
            },
            count: 7
        };
    }
}