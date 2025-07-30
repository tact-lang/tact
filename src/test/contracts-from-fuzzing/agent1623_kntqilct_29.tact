struct HasManyFields {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: Int;
    g: Bool;
    h: Address;
    i: Cell;
    j: Slice;
}

contract ManyStructs {
    a: HasManyFields;
    b: HasManyFields;
    c: HasManyFields;
    d: HasManyFields;

    init() {
        self.a = HasManyFields{a:1,b:true,c:myAddress(),d:emptyCell(),e:emptyCell().asSlice(),f:2,g:false,h:myAddress(),i:emptyCell(),j:emptyCell().asSlice()};
        self.b = HasManyFields{a:3,b:true,c:myAddress(),d:emptyCell(),e:emptyCell().asSlice(),f:4,g:false,h:myAddress(),i:emptyCell(),j:emptyCell().asSlice()};
        self.c = HasManyFields{a:5,b:true,c:myAddress(),d:emptyCell(),e:emptyCell().asSlice(),f:6,g:false,h:myAddress(),i:emptyCell(),j:emptyCell().asSlice()};
        self.d = HasManyFields{a:7,b:true,c:myAddress(),d:emptyCell(),e:emptyCell().asSlice(),f:8,g:false,h:myAddress(),i:emptyCell(),j:emptyCell().asSlice()};
    }
}