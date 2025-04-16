struct OptionalDeepLayer {
    x: Int?;
    sub: SubLayer?;
}

struct SubLayer {
    y: Bool;
    z: String?;
}

contract NestedOptStruct {
    data: OptionalDeepLayer = OptionalDeepLayer{x:null, sub:null};

    init() {
        self.data = OptionalDeepLayer{x:10, sub:SubLayer{y:true,z:null}};
    }

    receive() {
        let _ = self.data;
    }
}