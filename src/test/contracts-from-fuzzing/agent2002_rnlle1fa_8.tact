struct Inner2 {
    optText: String?;
    optNum: Int?;
}

struct Container {
    in1: Inner2?;
    in2: Inner2?;
    flag: Bool;
}

contract OptionalsNested {
    store: Container;

    init() {
        self.store = Container{
            in1: null,
            in2: Inner2{optText:null,optNum:5},
            flag: false
        };
    }
}
