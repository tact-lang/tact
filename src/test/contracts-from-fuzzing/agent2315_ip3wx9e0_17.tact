// Contract field containing a struct with many optional fields at mixed levels
struct MultiOpt {
    a: Int?;
    b: String?;
    c: Bool?;
}

struct WrapMulti {
    inner: MultiOpt;
    d: Int;
    e: Bool;
    f: String;
}

contract NestedManyOptionals {
    val: WrapMulti;

    init() {
        self.val = WrapMulti{
            inner: MultiOpt{
                a: null,
                b: null,
                c: true
            },
            d: 123,
            e: false,
            f: "xyz"
        };
    }
}