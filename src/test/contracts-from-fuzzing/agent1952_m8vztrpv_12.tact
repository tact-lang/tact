struct OptionStruct {
    i: Int?;
    b: Bool?;
    s: String?;
}

struct Container {
    os: OptionStruct?;
}

contract TestContract {
    cont: Container;

    init() {
        self.cont = Container{
            os: OptionStruct{
                i: 1,
                b: null,
                s: "test",
            },
        };
    }
}
