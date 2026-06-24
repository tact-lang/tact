struct NestedNulls {
    a: Int?;
    inner: InnerNull;
}

struct InnerNull {
    b: Int?;
    str: String?;
}

contract OptionalDeepNulls {
    val: NestedNulls;

    init() {
        self.val = NestedNulls{
            a:null,
            inner: InnerNull{
                b:null,
                str:null
            }
        };
    }
}