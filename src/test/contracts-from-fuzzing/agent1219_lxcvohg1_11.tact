// Testing optional nested struct with inner defaulted optional fields
struct Deep {
    val: Int;
    opt: Int?;
}

struct Wrap {
    inner: Deep?;
}

contract OptionalContainer {
    data: Wrap?;

    init() {
        self.data = Wrap{
            inner: Deep{
                val:42,
                opt:null
            }
        };
    }
}