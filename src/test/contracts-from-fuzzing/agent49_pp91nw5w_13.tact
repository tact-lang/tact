struct Composite {
    a: Int;
    b: Bool;
    c: String?;
    d: Int?;
}

contract CompositeHold {
    val: Composite;

    init() {
        self.val = Composite{a:1,b:true,c:null,d:null};
    }
}