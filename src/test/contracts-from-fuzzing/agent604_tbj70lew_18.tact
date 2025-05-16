struct ChildOpt {
    v: Int?;
}
struct ParentOpt {
    foo: ChildOpt?;
    bar: ChildOpt?;
}

contract OptCombo {
    data: ParentOpt;

    init() {
        self.data = ParentOpt{
            foo: null,
            bar: ChildOpt{v:null}
        };
    }

    receive() {
        let _ = self.data;
    }
}