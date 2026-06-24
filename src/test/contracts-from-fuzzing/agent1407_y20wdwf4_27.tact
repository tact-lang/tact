struct Sub {
    x: Int as int32;
    y: Int as uint8;
    z: Int;
}

struct Composite {
    fst: Sub;
    snd: Sub;
}

contract TestContract {
    comp: Composite;

    init() {
        self.comp = Composite{
            fst: Sub{ x:-2, y:200, z:123 },
            snd: Sub{ x:3, y:255, z:456 }
        };
    }
}