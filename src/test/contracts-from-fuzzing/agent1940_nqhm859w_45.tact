struct A {
    flag: Bool;
    opt: Int?;
}
contract OptionalMix {
    state: A;
    init() {
        self.state = A{ flag:true, opt:null };
    }
}