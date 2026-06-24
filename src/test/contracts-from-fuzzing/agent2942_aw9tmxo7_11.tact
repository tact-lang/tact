struct Rec1 {
    val1: Int;
    val2: Int?;
}

struct Rec2 {
    inner: Rec1;
    val3: Bool;
}

struct Rec3 {
    inner2: Rec2;
    val4: String;
}

contract NestedOptionalFields {
    data: Rec3;
    init() {
        self.data = Rec3{
            inner2: Rec2{
                inner: Rec1{
                    val1: 100,
                    val2: null,
                },
                val3: true,
            },
            val4: "ok",
        };
    }
}