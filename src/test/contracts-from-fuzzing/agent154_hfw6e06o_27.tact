struct AllBool {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
}

contract AllBoolContract {
    f: AllBool;

    init() {
        self.f = AllBool{a:true,b:false,c:true,d:false,e:true};
    }
}