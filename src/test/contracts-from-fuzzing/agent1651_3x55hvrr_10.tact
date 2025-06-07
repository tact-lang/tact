struct SubSub {
    z: Int;
}

struct Sub {
    y: Bool;
    subsub: SubSub;
}

struct Root {
    x: String;
    sub: Sub;
}

contract Test10 {
    rr: Root;

    init() {
        self.rr = Root{
            x: "abc",
            sub: Sub{ y: true, subsub: SubSub{z: 77} }
        };
    }
}
