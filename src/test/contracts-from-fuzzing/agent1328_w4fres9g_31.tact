// struct with many bools testing tight bit packing
struct Flags {
    f1: Bool;
    f2: Bool;
    f3: Bool;
    f4: Bool;
    f5: Bool;
    f6: Bool;
    f7: Bool;
    f8: Bool;
}
contract ManyBools {
    fl: Flags;
    init() {
        self.fl = Flags{
            f1:true, f2:false, f3:true, f4:true,
            f5:false, f6:true, f7:false, f8:false
        };
    }
}