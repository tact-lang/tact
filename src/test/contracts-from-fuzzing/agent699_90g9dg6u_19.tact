struct Sub {
    s: String; o: Int?;
}

contract SubOptional {
    inner: Sub;

    init() {
        self.inner = Sub{ s: "abc", o: null };
    }
}
