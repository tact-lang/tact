struct Inner {
    s: String;
    n: Int?;
    b: Bool;
}

contract StringFieldsInStruct {
    rec: Inner;

    init() {
        self.rec = Inner{s:"hello", n:null, b:true};
    }
}