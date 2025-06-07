struct OptionalNested2 {
    aa: AB?;
    flag: Bool;
}

struct AB {
    s: String;
    inn: Inner?;
}

struct Inner {
    iv: Int;
    bv: Bool;
}

contract OptionalNested2Struct {
    opt: OptionalNested2;

    init() {
        self.opt = OptionalNested2{
            aa: AB{ s: "test", inn: null },
            flag: false
        };
    }
}