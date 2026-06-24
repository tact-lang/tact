contract TestContract {
    flag1: Bool = true;
    flag2: Bool = false;

    init() {}

    get fun getFlags(): Flags {
        return Flags{
            flag1: self.flag1,
            flag2: self.flag2
        };
    }
}

struct Flags {
    flag1: Bool;
    flag2: Bool;
}
