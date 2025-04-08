struct PrimitiveHolder {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
}

contract PrimitiveStructTest {
    f: PrimitiveHolder;

    init() {
        self.f = PrimitiveHolder{i:1,b:true,s:"ok",c:emptyCell()};
    }
}