struct Sub {
    s: String;
    flag: Bool?;
}

struct Wrap {
    inner1: Sub;
    inner2: Sub;
    inner3: Sub;
}

contract StructArraySimulation {
    val: Wrap;

    init() {
        self.val = Wrap{
            inner1: Sub{s: "a", flag: null},
            inner2: Sub{s: "b", flag: false},
            inner3: Sub{s: "c", flag: true}
        };
    }
}