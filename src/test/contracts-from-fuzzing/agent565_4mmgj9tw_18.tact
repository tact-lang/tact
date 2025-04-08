struct Inner { a: Int as uint8; b: Bool; }
struct Outer {
    one: Inner;
    two: Inner;
}

contract UintStruct {
    data: Outer;
    init() {
        self.data = Outer{
            one: Inner{ a:10,b:true },
            two: Inner{ a:255,b:false },
        };
    }
}