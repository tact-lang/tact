struct RecNested {
    child: RecInner;
}

struct RecInner {
    grandchild: RecLeaf;
}

struct RecLeaf {
    text: String;
    flag: Bool;
    amount: Int;
}

contract TestContract {
    rec: RecNested;

    init() {
        self.rec = RecNested{ child: RecInner{ grandchild: RecLeaf{ text:"hi",flag:true,amount:42 } } };
    }
}