struct OptionalNested {
    x: Int?;
    y: Bool?;
    s: String?;
}

contract OptionalNestedDefaults {
    data: OptionalNested = OptionalNested{x:null,y:null,s:null};

    init() {
        self.data = OptionalNested{x:100,y:true,s:"ok"};
    }

    receive() {
        let _ = self.data.x != null ? self.data.x!! : 0;
    }
}