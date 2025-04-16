struct ManyFields {
    a: Int; b: Bool; c: String; d: Int?; e: Bool?; f: String?; g: Cell; h: Slice; i: Address; j: Int;
}

contract AllStorages {
    storage: ManyFields;

    init() {
        self.storage = ManyFields{
            a:1, b:true, c:"x", d:null, e:null, f:null,
            g:emptyCell(), h:emptyCell().asSlice(), i:myAddress(), j:9
        };
    }
}