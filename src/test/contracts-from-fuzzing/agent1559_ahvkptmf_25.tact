struct EmptyLike {
    optionalVal: Int?;
}

contract SingleOptStruct {
    s: EmptyLike;
    init() {
        self.s = EmptyLike{ optionalVal: null };
    }
}