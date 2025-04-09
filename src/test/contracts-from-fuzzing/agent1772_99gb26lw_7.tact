struct OptionalDeep {
    inner: Inner?;
}

struct Inner {
    flag: Bool;
    message: String;
}

contract Test7 {
    od: OptionalDeep;

    init() {
        self.od = OptionalDeep{
            inner: Inner{
                flag: true,
                message: "optional nested",
            }
        };
    }
}