struct OptionStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Container {
    o: OptionStruct;
}

contract TestContract {
    data: Container;
    init() {
        self.data = Container{
            o: OptionStruct{
                a: null,
                b: null,
                c: null,
            }
        };
    }
}
