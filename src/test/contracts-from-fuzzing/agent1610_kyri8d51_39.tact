struct SameKind {
    a:String;
    b:String;
    c:String;
}
contract SameKindFields {
    f:SameKind;
    init() {
        self.f=SameKind{a:"1",b:"2",c:"3"};
    }
}