struct HaveOptional {
    a: Int?;
}

struct WithOptional {
    x: Int;
    y: Bool;
    z: HaveOptional;
}

contract StructWithOptField {
    s: WithOptional;

    init() {
        self.s = WithOptional{
            x:1,
            y:true,
            z:HaveOptional{a:null}
        };
    }
}