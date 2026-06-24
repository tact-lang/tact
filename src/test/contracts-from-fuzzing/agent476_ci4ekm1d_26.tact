struct LSD {
    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
    e: Address;
    f: String;
}

contract VariousFields {
    val: LSD;

    init() {
        self.val = LSD{a:1,b:true,c:emptyCell(),d:emptyCell().asSlice(),e:myAddress(),f:"test"};
    }
    receive() {
        let _ = self.val.a;
    }
}