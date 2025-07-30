struct SubA {
    v: Int;
}

struct SubB {
    v: Int?;
}

struct Container {
    a: SubA;
    b: SubB;
    flag: Bool;
    s: String;
}

contract TestContract {
    val: Container;

    init() {
        self.val = Container{
            a: SubA{v: 1},
            b: SubB{v: null},
            flag: false,
            s: "abc"
        };
    }

    receive() {}
}