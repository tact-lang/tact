struct DeepOptionals {
    first: Int?;
    second: String?;
    third: InnerStruct?;
}

struct InnerStruct {
    flag: Bool;
    message: String?;
}

contract TestContract {
    opt: DeepOptionals;
    init() {
        self.opt = DeepOptionals{
            first: null,
            second: "hey",
            third: InnerStruct{
                flag: true,
                message: null
            }
        };
    }
}