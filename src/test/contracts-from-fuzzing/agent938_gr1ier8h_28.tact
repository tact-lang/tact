struct Combined {
    ii: Int;
    bb: Bool;
    ss: String;
}

contract ComboFields {
    f1: Combined;
    f2: Combined;
    f3: Combined;

    init() {
        self.f1 = Combined{ii:1,bb:true,ss:"a"};
        self.f2 = Combined{ii:2,bb:false,ss:"b"};
        self.f3 = Combined{ii:3,bb:true,ss:"c"};
    }
}
