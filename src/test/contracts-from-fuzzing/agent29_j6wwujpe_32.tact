struct Flags {
    f1: Bool;
    f2: Bool;
    f3: Bool;
}

contract BoolDefaults {
    data: Flags = Flags{f1:true,f2:false,f3:true};
}