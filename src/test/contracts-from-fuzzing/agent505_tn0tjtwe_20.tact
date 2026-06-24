struct StringOpt {
    s: String = "hi";
    o: String?;
}

contract StringOptContract {
    data: StringOpt;

    init() {
        self.data = StringOpt{o: null};
    }
}
