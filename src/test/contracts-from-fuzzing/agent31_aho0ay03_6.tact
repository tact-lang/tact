struct DeepFields2 {
    a: Int;
    b: Int as uint8;
    c: Int as int32;
    d: Int as int257;
    e: Bool;
    f: Address;
    g: Cell;
    h: Slice;
    i: String;
}

contract TestContract {
    state: DeepFields2;

    init() {
        self.state = DeepFields2{
            a:1,b:2,c:3,d:4,e:true,f:myAddress(),g:emptyCell(),h:emptyCell().asSlice(),i:"hi"
        };
    }
}
