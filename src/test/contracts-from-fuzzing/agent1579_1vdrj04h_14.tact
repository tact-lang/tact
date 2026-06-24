struct DeeplyNestedOptional {
    inner1: Int?;
    inner2: Bool?;
}

struct Outer {
    dno: DeeplyNestedOptional?;
}

contract OptionalOptStruct {
    val: Outer;
    init() {
        self.val = Outer{ dno: null };
    }
}