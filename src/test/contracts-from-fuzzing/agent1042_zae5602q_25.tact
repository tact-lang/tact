struct Tuple {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
}

contract TupleStruct {
    t1: Tuple;
    t2: Tuple;
    init() {
        self.t1 = Tuple{a:1,b:true,c:address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),d:emptyCell(),e:emptyCell().asSlice(),f:"abc"};
        self.t2 = Tuple{a:2,b:false,c:address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),d:emptyCell(),e:emptyCell().asSlice(),f:"def"};
    }
}