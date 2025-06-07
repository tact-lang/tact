struct AllTypes {
    i: Int;
    b: Bool;
    s: String;
    oi: Int?;
    ob: Bool?;
    os: String?;
}

contract ComboTypes {
    f: AllTypes;

    init() {
        self.f = AllTypes{
            i:0, b:true, s:"s", oi:null, ob:false, os:null
        };
    }
}