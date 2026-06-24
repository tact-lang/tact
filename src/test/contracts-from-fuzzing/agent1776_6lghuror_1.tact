struct InnerStruct {
    x: Int;
    y: Bool;
}

struct OuterStruct {
    a: InnerStruct;
    b: Int?;
}

contract TestContract {
    val: OuterStruct = OuterStruct{a: InnerStruct{x: 42, y: true}, b: null};

    init() {
        self.val = OuterStruct{a: InnerStruct{x: 1, y: false}, b: 777};
    }

    receive() {
        let _ = self.val.a.x;
    }
}