struct Cont {
    flag: Bool;
    s: String;
}

contract TupleAndBoolStr {
    a: Int;
    c: Cont;

    init() {
        self.a=5;
        self.c=Cont{flag:true,s:"yo"};
    }
}
