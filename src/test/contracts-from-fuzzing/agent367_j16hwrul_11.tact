struct Layer3 {
    val: Int;
    note: String;
    ok: Bool;
}
struct Layer2 {
    a: Layer3;
    b: Layer3;
}
struct Layer1 {
    one: Layer2;
    two: Layer2;
    flag: Bool;
}
contract TreeStruct {
    tree: Layer1;
    init() {
        self.tree = Layer1{
            one: Layer2{
                a: Layer3{val:1, note:"a", ok:true},
                b: Layer3{val:2, note:"b", ok:false}
            },
            two: Layer2{
                a: Layer3{val:3, note:"c", ok:true},
                b: Layer3{val:4, note:"d", ok:true}
            },
            flag: false
        };
    }
}