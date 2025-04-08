struct MaybeInner {
    content: Int?;
    flag: Bool?;
}

contract Test {
    data: MaybeInner;

    init() {
        self.data = MaybeInner{content: null, flag: true};
    }
}