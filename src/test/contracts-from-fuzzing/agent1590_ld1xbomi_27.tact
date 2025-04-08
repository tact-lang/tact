struct VariedTypes {
    a:Int;
    b:Bool;
    c:String;
    d:Slice;
    e:Cell;
    f:Address;
    g:Int?;
    h:Bool?;
    i:String?;
}

contract VariedFields {
    field: VariedTypes;

    init() {
        self.field = VariedTypes {
            a:1,b:true,c:"c",d:emptyCell().asSlice(),e:emptyCell(),f:myAddress(),
            g:null,h:null,i:null
        };
    }
}