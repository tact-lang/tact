struct OptStruct {
    x: Int?;
    y: Int?;
}

struct Container {
    opt1: OptStruct?;
    opt2: OptStruct?;
}

contract TestContract {
    con: Container;

    init() {
        self.con = Container{
            opt1: null,
            opt2: null,
        };
    }
}