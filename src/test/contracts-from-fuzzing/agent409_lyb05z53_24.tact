struct FlatTypes {
    a: Int;
    b: Bool;
    c: String;
}
struct NestedFlat {
    x: FlatTypes;
    y: FlatTypes;
}
contract NestedFlatContract {
    data: NestedFlat;

    init() {
        self.data = NestedFlat{
            x: FlatTypes{ a:1,b:true,c:"x" },
            y: FlatTypes{ a:2,b:false,c:"y" }
        };
    }
}