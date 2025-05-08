struct ComboInner {
    a: Int?;
    b: Bool;
}

struct ComboOuter {
    x: ComboInner?;
    y: Int;
}

contract OptionalStructField {
    val: ComboOuter;

    init() {
        self.val = ComboOuter{
            x: ComboInner{ a:null, b:true }, y: 123
        };
    }
}