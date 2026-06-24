struct WithBoolIntStr {
    a: Bool;
    b: Int;
    c: String;
}

struct Also {
    d: WithBoolIntStr;
    e: Int;
}

contract CrossNested {
    data: Also;
    init() {
        self.data = Also{
            d: WithBoolIntStr{a:true,b:1,c:"x"},
            e:10
        };
    }
}
