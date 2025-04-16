struct OptionalStruct {
    x: Int?;
    y: Bool?;
    z: Address?;
    s: String?;
    c: Cell?;
    sl: Slice?;
}

contract TestOptional {
    val: OptionalStruct;
    
    init() {
        self.val = OptionalStruct{
            x: null, y: null, z: null, s: null, c: null, sl: null
        };
    }
}