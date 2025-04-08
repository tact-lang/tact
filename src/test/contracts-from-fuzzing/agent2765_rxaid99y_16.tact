struct NestedOpt {
    s: String?;
    b: Bool;
}

contract SequenceTest {
    a: String;
    b: NestedOpt;
    c: Int;
    d: NestedOpt;

    init() {
        self.a = "hi";
        self.b = NestedOpt{s:null,b:true};
        self.c = 39;
        self.d = NestedOpt{s:"x",b:false};
    }
}