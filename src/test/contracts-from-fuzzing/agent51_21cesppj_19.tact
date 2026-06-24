struct DeepOpt {
    inner: Int?;
}

struct MiddleOpt {
    deep: DeepOpt?;
}

contract DoubleOptional {
    value: MiddleOpt?;

    init() {
        self.value = MiddleOpt{ deep: DeepOpt{ inner: null } };
    }
}