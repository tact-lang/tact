struct SOpt {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct SNestedOpt {
    a: SOpt?;
    b: SOpt?;
}

contract TestContract {
    s: SNestedOpt;

    init() {
        self.s = SNestedOpt{
            a: null,
            b: SOpt{x:null,y:null,z:null}
        };
    }
}