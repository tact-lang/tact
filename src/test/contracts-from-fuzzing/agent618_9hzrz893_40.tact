struct ManyNestedOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Int;
    f: Bool;
    g: String;
    h: Cell;
}

contract LargeMix {
    val: ManyNestedOpt;

    init() {
        self.val = ManyNestedOpt{
            a:null, b:true, c:"hello", d:null,
            e:5, f:false, g:"world", h:emptyCell()
        };
    }
}