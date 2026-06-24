struct SOptional {
    s: String?;
}

struct IOptional {
    i: Int?;
}

contract MultOptStructs {
    so: SOptional;
    io: IOptional;

    init() {
        self.so = SOptional{s:null};
        self.io = IOptional{i:null};
    }
}