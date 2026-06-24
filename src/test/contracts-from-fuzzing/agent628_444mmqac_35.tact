struct Layer1 {
    data1: Layer2;
    data2: Layer2;
}

struct Layer2 {
    info: Int;
}

contract MultiBranch {
    many: Layer1;

    init() {
        self.many = Layer1{ data1: Layer2{ info:7 }, data2: Layer2{ info:9 } };
    }
}