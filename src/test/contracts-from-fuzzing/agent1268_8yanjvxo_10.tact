struct InnerMany {
    i1: Int;
    i2: Bool;
    i3: String;
}

struct OuterStruct {
    a: Bool;
    b: Int;
    c: String;
    d: InnerMany;
}

contract TestContract {
    s: OuterStruct;

    init() {
        self.s = OuterStruct{
            a: true,
            b: 1,
            c: "abc",
            d: InnerMany{i1:2, i2:false, i3:"def"}
        };
    }
}