struct S0 {
    x: Int?;
}

struct S1 {
    y: Bool?;
}

struct Container {
    inner0: S0?;
    inner1: S1?;
    flag: Bool;
}

contract OptInOpt {
    data: Container?; 
    init() {
        self.data = Container{
            inner0: null,
            inner1: null,
            flag: false
        };
    }
}