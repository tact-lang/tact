struct OptStruct {
    a: Int?;
    b: Bool?;
    c: InnerOpt?;
}

struct InnerOpt {
    val: Int?;
}

contract OptionalContract {
    data: OptStruct;

    init() {
        self.data = OptStruct{
            a: null,
            b: true,
            c: InnerOpt{
                val: null
            }
        };
    }
}