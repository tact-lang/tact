// OPTIONAL with multiple nested optionals + init null
struct Bottom {
    val: Int;
}
struct Middle {
    bottom: Bottom?;
}
struct Top {
    middle: Middle?;
}

contract OptChain {
    data: Top;
    init() {
        self.data = Top { middle: null };
    }
}