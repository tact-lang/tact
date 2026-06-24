// minimal test nested contract optional containing large optional nested structure
struct L1 { a:Int?; }
struct L2 { b:L1?; }
struct L3 { c:L2?; }

contract NestedOptionals {
    deep: L3?;

    init() {
        self.deep = null;
    }
}