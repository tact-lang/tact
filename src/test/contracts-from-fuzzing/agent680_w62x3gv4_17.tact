struct Pack {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Bool?;
    h: Int?;
    i: String?;
    j: Address?;
}

contract MixedFieldsContract {
    pack: Pack;

    init() {
        self.pack = Pack{
            a:42,b:false,c:"hello",d:myAddress(),e:emptyCell(),f:emptyCell().asSlice(),
            g:true,h:123,i:"optional",j:myAddress()
        };
    }

    receive() {
        let _ = self.pack.a + 1;
    }
}