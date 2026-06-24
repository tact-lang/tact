struct OptStruct {
    inner: InnerStruct?;
}

struct InnerStruct {
    n: Int;
    s: String;
    f: FlagStruct?;
}

struct FlagStruct {
    yes: Bool;
    no: Bool;
}

contract TestContract {
    data: OptStruct;

    init() {
        self.data = OptStruct{
            inner: InnerStruct{
                n: 1,
                s: "str",
                f: FlagStruct{ yes: true, no: false }
            }
        };
    }
}