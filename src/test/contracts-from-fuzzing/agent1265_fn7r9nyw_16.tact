struct Alt1 {
    flag: Bool;
    note: String?;
}
struct Alt2 {
    yes: Bool?;
    num: Int;
}

contract MultiFields {
    f1: Alt1;
    f2: Alt2;

    init() {
        self.f1 = Alt1{ flag:true, note:null };
        self.f2 = Alt2{ yes:null, num:10 };
    }
}