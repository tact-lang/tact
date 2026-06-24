struct Rec {
    a: Int?;
    b: Bool?;
}

struct Out {
    r1: Rec?;
    r2: Rec?;
}

contract MultiOptStruct {
    val: Out;

    init() {
        self.val = Out{r1: null, r2: null};
    }
}