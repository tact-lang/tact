struct Inner { a:Int; b:Bool }
struct StrNest { s: Inner }

contract NestedStructInStruct2 {
    data: StrNest;
    init() {
        self.data = StrNest{ s: Inner{ a:10, b:true } };
    }
}