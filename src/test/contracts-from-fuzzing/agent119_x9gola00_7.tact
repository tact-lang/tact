struct NestedOpt {
    innerVal: Int?;
    str: String?;
    boolVal: Bool?;
}

struct Composite {
    topVal: Int;
    child: NestedOpt;
}

contract TestContract {
    comp: Composite;

    init() {
        self.comp = Composite{
            topVal: 4,
            child: NestedOpt{innerVal: null, str: null, boolVal: true}
        };
    }

    receive() {
        let c = self.comp;
    }
}