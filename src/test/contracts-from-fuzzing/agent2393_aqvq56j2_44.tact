struct DifferentLayout {
    ai: Int as uint8;
    si: Int as uint64;
    di: Int as int16;
    def: Int;
    b: Bool;
    s: String;
    so: String?;
}

contract DiffLayout {
    d: DifferentLayout = DifferentLayout{
        ai: 255, si:42, di: -123, def: 1, b:true, s:"abc", so:null
    };
}