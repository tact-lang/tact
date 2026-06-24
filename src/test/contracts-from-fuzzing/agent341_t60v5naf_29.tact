struct Various {
    i: Int;
    b: Bool;
    s: String;
    io: Int?;
    bo: Bool?;
    so: String?;
}

struct Wrap {
    v: Various;
    label: String;
    counter: Int;
}

contract WrappedFields {
    data: Wrap;

    init() {
        self.data = Wrap{
            v: Various{
                i:1, b:true, s:"s", io:null, bo:false, so:null
            },
            label: "lbl",
            counter: 0
        };
    }
}