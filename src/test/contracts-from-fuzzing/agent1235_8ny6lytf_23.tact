struct StrNest {
    sub: SubStruct;
}

struct SubStruct {
    val: Int?;
}

contract OptNested {
    data: StrNest?;

    init() {
        self.data = StrNest{
            sub: SubStruct{
                val: null
            }
        };
    }
}