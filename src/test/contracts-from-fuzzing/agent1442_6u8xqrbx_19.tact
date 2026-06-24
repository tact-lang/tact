// edge case: structs with many bool fields to check bit packing
struct Flags {
    f0: Bool;
    f1: Bool;
    f2: Bool;
    f3: Bool;
    f4: Bool;
    f5: Bool;
    f6: Bool;
    f7: Bool;
}

contract TestContract {
    flags: Flags;
    init() {
        self.flags = Flags{
            f0:true, f1:false, f2:true, f3:false,
            f4:true, f5:false, f6:true, f7:false
        };
    }
}