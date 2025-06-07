struct ComplexInner {
    number: Int;
    flag: Bool;
    txt: String;
    addr: Address;
}

struct ComplexOuter {
    ci1: ComplexInner;
    ci2: ComplexInner;
    ci3: ComplexInner;
}

contract ComplexNestedStructs {
    data: ComplexOuter;

    init() {
        self.data = ComplexOuter{
            ci1: ComplexInner{ number:1, flag:true, txt:"a", addr:myAddress() },
            ci2: ComplexInner{ number:2, flag:false, txt:"b", addr:myAddress() },
            ci3: ComplexInner{ number:3, flag:true, txt:"c", addr:myAddress() }
        };
    }
}