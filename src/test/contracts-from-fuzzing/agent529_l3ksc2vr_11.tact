struct Optionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
}

struct Wrapping {
    o1: Optionals;
    o2: Optionals;
}

contract RepeatedStruct {
    w: Wrapping;

    init() {
        self.w = Wrapping{
            o1: Optionals{a:null,b:null,c:null,d:null,e:null},
            o2: Optionals{a:null,b:null,c:null,d:null,e:null}
        };
    }
}