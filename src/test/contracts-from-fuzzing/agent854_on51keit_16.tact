struct Container {
    s1: String;
    s2: String;
}

contract MixedPersistence {
    num: Int;
    flag: Bool;
    data: Container;

    init() {
        self.num = 5;
        self.flag = true;
        self.data = Container{
            s1: "one",
            s2: "two"
        };
    }
}