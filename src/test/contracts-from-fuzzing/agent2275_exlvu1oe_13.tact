struct StrOpt {
    s1: String?;
    s2: String?;
    s3: String?;
}

struct IntOpt {
    i1: Int?;
    i2: Int?;
    i3: Int?;
}

contract MultiOptStructs {
    so: StrOpt;
    io: IntOpt;
    init() {
        self.so = StrOpt{ s1:null, s2:null, s3:null };
        self.io = IntOpt{ i1:null, i2:null, i3:null };
    }
}