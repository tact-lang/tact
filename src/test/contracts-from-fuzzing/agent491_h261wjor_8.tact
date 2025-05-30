struct SInner { x: Int; y: Bool; z: String; } 

struct SOuter {
    inner: SInner;
    extra: Int;
    flag: Bool?;
}

contract NestedWithOptional {
    data: SOuter;
    init() {
        self.data = SOuter{
            inner: SInner{ x: 3, y: true, z: "z" },
            extra: 5,
            flag: null,
        };
    }
}