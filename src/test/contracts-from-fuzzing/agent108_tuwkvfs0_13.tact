struct Variety {
    small: Int as uint1;
    normal: Int;
    large: Int as int257;
    deep: DeepNest;
}

struct DeepNest {
    flag: Bool;
    data: Int as uint1;
}

contract Test12 {
    item: Variety;

    init() {
        self.item = Variety{
            small: 1,
            normal: 12345,
            large: -999,
            deep: DeepNest{
                flag: false,
                data: 0
            }
        };
    }
}