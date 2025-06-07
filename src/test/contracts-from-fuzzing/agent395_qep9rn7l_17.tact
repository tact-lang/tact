struct DeepLevel {
    big: Int as int257;
    note: String;
}

struct Container {
    deep: DeepLevel;
    flag: Bool;
}

contract DeepBigInt {
    data: Container;

    init() {
        self.data = Container{
            deep: DeepLevel{
                big: -17,
                note: "yo"
            },
            flag: true
        };
    }
}
