struct TripleNested {
    a: Int;
    b: Bool;
}

struct SecondLevel {
    inner: TripleNested;
    s: String;
}

contract DefaultDeepNested {
    superData: SecondLevel = SecondLevel{
        inner: TripleNested{a:5,b:true},
        s: "ok"
    };
}