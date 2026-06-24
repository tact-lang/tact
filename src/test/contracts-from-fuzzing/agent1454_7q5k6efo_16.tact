struct RefStruct {
    ref1: Cell;
    ref2: Cell;
    ref3: Cell;
}

contract MultipleRefsTest {
    refs: RefStruct;

    init() {
        self.refs = RefStruct{
            ref1: emptyCell(),
            ref2: emptyCell(),
            ref3: emptyCell()
        };
    }

    receive() {
        let _ = self.refs.ref2;
    }
}