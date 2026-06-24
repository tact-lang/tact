struct OptDeepNested {
    optInner: Deep?;
}

struct Deep {
    a: Int;
    b: Bool?;
}

contract OptDeepTest {
    v: OptDeepNested = OptDeepNested{optInner: null};

    init() {
        self.v = OptDeepNested{optInner: Deep{a:5,b:true}};
    }

    receive() {
        let _ = self.v;
    }
}