struct JustFlags {
    yes: Bool;
    no: Bool;
}

contract OnlyBools {
    flags: JustFlags;

    init() {
        self.flags = JustFlags{ yes:true,no:false };
    }
}
