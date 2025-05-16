// Persistent storage struct with many bool fields and optionals
struct Flags {
    f1: Bool;
    f2: Bool?;
    f3: Bool;
    f4: Bool?;
    f5: Bool;
    f6: Bool?;
    f7: Bool;
    f8: Bool?;
}

contract Booly {
    flags: Flags;

    init() {
        self.flags = Flags{
            f1:true, f2:null, f3:true, f4:null,
            f5:false, f6:null, f7:true, f8:null
        };
    }
}