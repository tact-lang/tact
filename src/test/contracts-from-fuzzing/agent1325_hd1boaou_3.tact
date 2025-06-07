struct DeepNested {
    flag: Bool;
    amount: Int;
}

struct Container {
    level1: Int;
    deep: DeepNested;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            level1: 1,
            deep: DeepNested{
                flag: true,
                amount: 100
            }
        };
    }

    receive() {
        self.data = Container{
            level1: self.data.level1 + 1,
            deep: self.data.deep
        };
    }
}