struct OptionalStruct {
    x: Int?;
    y: Bool?;
    str: String?;
    addr: Address?;
    cell: Cell?;
    slice: Slice?;
}

contract EmbedOptional {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            x:null,y:null,str:null,addr:null,cell:null,slice:null
        };
    }
}
