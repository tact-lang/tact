struct Lvl3 {
    l3int: Int;
    l3str: String;
}

struct Lvl2 {
    l2bool: Bool;
    l2inner: Lvl3;
}

struct Lvl1 {
    l1opt: Lvl2?;
    l1val: Int;
}

contract DeepChainOptional {
    nested: Lvl1;

    init() {
        self.nested = Lvl1{
            l1opt: Lvl2{
                l2bool: true,
                l2inner: Lvl3{
                    l3int: 1,
                    l3str: "deepstr"
                }
            },
            l1val: 999
        };
    }
}