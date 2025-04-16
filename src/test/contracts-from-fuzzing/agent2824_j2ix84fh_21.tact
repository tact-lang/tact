struct InnerOpt { val: Int? }

contract OptionalStructField {
    data: InnerOpt;

    init() {
        self.data = InnerOpt{ val: null };
    }
}