// A wide flat struct with many fields, mixed optionals
struct Wide {
    v1: Int; v2: Int?; v3: Bool; v4: Bool?; v5: String;
    v6: String?; v7: Address; v8: Address?; v9: Slice;
    v10: Slice?; v11: Cell; v12: Cell?; v13: Int; v14: Int?;
    v15: Bool; v16: Bool?; v17: String; v18: String?;
}

contract WideStructStore {
    node: Wide;

    init() {
        self.node = Wide{
            v1:1, v2:null, v3:true, v4:false, v5:"five",
            v6:null, v7:myAddress(), v8:null, v9:emptyCell().asSlice(),
            v10:null, v11:emptyCell(), v12:null, v13:13, v14:null,
            v15:true, v16:null, v17:"seventeen", v18:null
        };
    }
}
