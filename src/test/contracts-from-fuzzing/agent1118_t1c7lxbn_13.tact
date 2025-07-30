struct StringOptional {
    a: String?;
    b: String?;
}

struct StringOptionalOuter {
    inner: StringOptional?;
    c: String;
}

contract TestContract {
    data: StringOptionalOuter;

    init() {
        self.data = StringOptionalOuter{
            inner: null,
            c: "zzz"
        };
    }
}