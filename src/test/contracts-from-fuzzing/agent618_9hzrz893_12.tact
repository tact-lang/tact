struct TupleWrap {
    a: Int;
    b: Bool;
}

contract WithOptionalTupleWrap {
    val: TupleWrap?;

    init() {
        self.val = TupleWrap{a:5,b:true};
    }
}