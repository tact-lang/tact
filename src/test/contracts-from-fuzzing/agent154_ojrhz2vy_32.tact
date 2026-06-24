struct BoolOptionals {
    a: Bool?;
    b: Bool?;
    c: Bool?;
    d: Bool?;
    e: Bool?;
}

contract OptionalBoolsContract {
    val: BoolOptionals;

    init() {
        self.val = BoolOptionals{ a:true, b:null, c:false, d:null, e:true };
    }
}