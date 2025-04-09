struct AA {
    x: Int;
    y: Bool;
}

struct BB {
    z: Int;
    nested: AA;
}

struct CC {
    a: AA;
    b: BB;
}

contract DeepStructMix {
    persist: CC;

    init() {
        self.persist = CC{
            a: AA{ x:1, y:true },
            b: BB{ z:2, nested: AA{ x:3, y:false } }
        };
    }
}
