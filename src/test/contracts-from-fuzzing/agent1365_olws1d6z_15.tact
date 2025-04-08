struct InnerHolder {
    txt: String;
}

contract OptionalInnerHolder {
    ih: InnerHolder?;

    init() {
        self.ih = null;
    }
}