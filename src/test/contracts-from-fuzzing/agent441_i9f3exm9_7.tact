struct Inner1 {
    x: Int;
}

struct Inner2 {
    y: Int;
}

struct Container {
    opt1: Inner1?;
    opt2: Inner2?;
    strOpt: String?;
    boolOpt: Bool?;
}

contract TestContract {
    cont: Container;

    init() {
        self.cont = Container{
            opt1: null,
            opt2: null,
            strOpt: null,
            boolOpt: null
        };
    }
}
