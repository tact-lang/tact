struct HaveOptionals {
    foo: Int?;
    bar: Bool?;
}

contract SetOptionalsInStruct {
    val: HaveOptionals;

    init() {
        self.val = HaveOptionals{foo: null, bar: true};
    }
}