struct AStruct {
    a: Int;
}
struct BStruct {
    b: Int;
    nested: AStruct;
}
struct CStruct {
    c: Bool;
    nestedB: BStruct;
}
contract MultiLevelNested {
    val: CStruct;

    init() {
        self.val = CStruct{
            c: true,
            nestedB: BStruct{
                b: 15,
                nested: AStruct{
                    a: 5,
                },
            },
        };
    }
}