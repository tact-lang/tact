struct StringOptBool {
    s: String;
    o: String?;
    b: Bool;
}

contract Combine {
    f: StringOptBool;
    init() {
        self.f = StringOptBool{ s:"hi", o:null, b:true };
    }
}