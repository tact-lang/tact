// Compose nested optional branches initializing some inner ones
struct L2 {
    val:Int?;
}
struct L1 {
    leaf:L2?;
    text:String?;
}

contract BranchOverride {
    nest:L1?;

    init() {
        self.nest = L1{
            leaf:null,
            text:null
        };
    }
}