struct Mix {
    a: Int;
    b: Bool;
    c: String?;
    d: Slice;
    e: Cell;
    f: Address;
    g: Bool?;
}

contract MixedNested {
    content: Mix;

    init() {
        self.content = Mix{a:1,b:true,c:null,d:emptyCell().asSlice(),e:emptyCell(),f:myAddress(),g:null};
    }
}