struct NestedOpt {
    inner: Int?;
}

contract OptContract {
    optionalVal: NestedOpt = NestedOpt{ inner: null };

    init() {
        self.optionalVal = NestedOpt{ inner: 777 };
    }
}