struct OptionalIntWrapper {
    val: Int?;
}

contract OptionalEdge {
    wrapped: OptionalIntWrapper;
    
    init() {
        self.wrapped = OptionalIntWrapper{ val: null };
    }
}