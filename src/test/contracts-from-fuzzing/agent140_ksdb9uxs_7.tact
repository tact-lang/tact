struct OptDeep {
    val: Int?;
    txt: String;
}

struct NestOpt {
    deeper: OptDeep;
}

contract ComboOptionalNested {
    data: NestOpt;

    init() {
        self.data = NestOpt{
            deeper: OptDeep{
                val: null,
                txt: "hello",
            }
        };
    }
}