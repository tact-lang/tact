// Contract deep nested optional chain
struct Bottom {
    val: Int?; 
}
struct Mid {
    bot: Bottom?;
}
struct Top {
    mid: Mid?;
}

contract DeepOptionChain {
    storage: Top;
    init() {
        self.storage = Top { mid: null };
    }
}