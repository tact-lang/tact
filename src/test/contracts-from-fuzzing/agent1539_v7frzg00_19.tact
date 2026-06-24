struct DeepFields {
    a: Int;
    b: Inner1;
    c: Inner2;
}

struct Inner1 {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct Inner2 {
    p: Slice;
    q: Address?;
}

contract MultiInnerOptional {
    val: DeepFields;
    init() {
        self.val = DeepFields{
            a: 1,
            b: Inner1{x:null,y:null,z:null},
            c: Inner2{p:emptyCell().asSlice(),q:null}
        };
    }
}