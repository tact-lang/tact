struct S {
    a: Int;
    b: Bool;
}

contract RepeatFieldType {
    x:S;
    y:S;

    init() {
        self.x=S{a:1,b:true};
        self.y=S{a:0,b:false};
    }
}
