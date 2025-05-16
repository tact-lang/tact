struct SubItem {
    val: Int;
}
struct ParentItem {
    a: Int;
    b: SubItem;
    c: Bool?;
    d: String;
}
contract NestedSubitem {
    p: ParentItem;
    init() {
        self.p = ParentItem{a:1,b:SubItem{val:2},c:null,d:"str"};
    }
}