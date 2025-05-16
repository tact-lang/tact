struct SubSub {
    flag: Bool?;
    num: Int;
}

struct Sub {
    one: Int;
    nested: SubSub;
}

struct MainOne {
    a: Sub;
    b: Bool;
    c: Int?;
}

contract TestContract {
    data: MainOne;

    init() {
        self.data = MainOne{
            a: Sub{ one: 1, nested: SubSub{ flag: null, num: 100 } },
            b: false,
            c: null
        };
    }
}