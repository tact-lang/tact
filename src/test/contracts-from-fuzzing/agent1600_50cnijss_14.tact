struct Sub {
    x: Int;
}

struct Container {
    optSub: Sub?;
    reqSub: Sub;
    flag: Bool;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            optSub: null,
            reqSub: Sub{ x: 55 },
            flag: true
        };
    }
}