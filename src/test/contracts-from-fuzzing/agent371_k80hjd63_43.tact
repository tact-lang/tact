struct OptStrAndAddr {
    s:String?;
    a:Address?;
}
contract TestContract {
    f: OptStrAndAddr;
    init() {
        self.f = OptStrAndAddr{ s:null, a:null };
    }
}