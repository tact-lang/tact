struct NestedMixed {
    a: Int;
    b: Bool;
    c: Address;
    d: Slice;
    e: String?;
    f: Cell;
}

contract MixedStorage {
    content: NestedMixed;

    init() {
        self.content = NestedMixed{
            a:1,b:true,c:myAddress(),d:emptyCell().asSlice(),e:null,f:emptyCell()
        };
    }

    receive() {
        self.content = self.content;
    }
}