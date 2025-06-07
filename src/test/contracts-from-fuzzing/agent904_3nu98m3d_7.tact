struct Deeply {
    foo: Int;
}

struct Mid1 {
    x: Deeply;
}

struct Mid2 {
    y: Mid1;
}

struct TopStruct {
    z: Mid2;
}

contract DeepStructs {
    store: TopStruct;
    init() {
        self.store = TopStruct{
            z: Mid2{
                y: Mid1{
                    x: Deeply{ foo: 99 }
                }
            }
        };
    }
}