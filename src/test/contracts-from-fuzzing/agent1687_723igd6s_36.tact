struct Flags {
    ready: Bool;
    active: Bool;
    valid: Bool;
}

contract FlagsTest {
    flags: Flags;

    init() {
        self.flags = Flags{ ready:true, active:false, valid:true };
    }
}