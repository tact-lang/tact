struct DeepOptional {
    d: Int?;
}

struct NestedOptHolder {
    inner: DeepOptional?;
    flag: Bool;
}

contract OptionalStructField {
    data: NestedOptHolder;

    init() {
        self.data = NestedOptHolder{
            inner: DeepOptional{ d: 77 },
            flag: true
        };
    }
}