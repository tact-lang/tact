struct OptStruct {
    s: String;
    n: Int?;
    f: Bool?;
}

contract Test4 {
    ps: OptStruct;

    init() {
        self.ps = OptStruct{
            s: "opt",
            n: null,
            f: true,
        };
    }
}