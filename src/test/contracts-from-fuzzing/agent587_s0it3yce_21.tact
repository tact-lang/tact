struct ManyNestedOpts {
    a: Int?;
    b: Bool?;
    c: SubStruct?;
}

struct SubStruct {
    x: Int?;
    y: Bool?;
}

contract MultiOptPersists {
    data: ManyNestedOpts;
    init() {
        self.data = ManyNestedOpts{
            a:null, b:null, c:null
        };
    }
    receive() {
        if (self.data.c != null) {
            let _ = self.data.c!!;
        }
    }
}