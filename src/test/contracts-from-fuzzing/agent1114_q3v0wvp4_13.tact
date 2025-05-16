struct OneLevel {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
}

struct TwoLevel {
    x: OneLevel;
    y: OneLevel;
    z: OneLevel;
}

struct ThreeLevel {
    inner: TwoLevel;
    extra: Bool;
}

contract TripleNested {
    data: ThreeLevel;

    init() {
        let s = OneLevel{a:1,b:false,c:"",d:myAddress(),e:emptyCell()};
        self.data = ThreeLevel{
            inner: TwoLevel{x:s,y:s,z:s},
            extra: true
        };
    }
}