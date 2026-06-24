struct Rec {
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    text: String;
}

contract NestedExplicit {
    dat: Rec;

    init() {
        self.dat = Rec { inner: InnerStruct { flag: false, text: "hello" } };
    }
}