struct OneLongField {
    a: Int; b: Int; c: Int;
}
struct MidStruct {
    s: OneLongField; 
    x: Int;
}
contract NestedAndFlat {
    data: MidStruct;
    init() {
        self.data = MidStruct{ s: OneLongField{ a:1,b:2,c:3 }, x: 4 };
    }
}