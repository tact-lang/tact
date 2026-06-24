// Struct combining explicit int serialization and optional inner struct
struct Inner { x: Int as uint16; }
struct Outer {
    inn: Inner?;
    y: Int as int8;
}

contract TestContract {
    val: Outer;
    init() {
        self.val = Outer{
            inn: Inner{ x: 65535 },
            y: -128,
        };
    }
}
