struct OptionalWrap {
    data: Int?;
    flag: Bool?;
}

contract OptWrapArray {
    e0: OptionalWrap;
    e1: OptionalWrap;
    e2: OptionalWrap;
    e3: OptionalWrap;

    init() {
        self.e0 = OptionalWrap{ data: null, flag: false };
        self.e1 = OptionalWrap{ data: 1, flag: true };
        self.e2 = OptionalWrap{ data: null, flag: null };
        self.e3 = OptionalWrap{ data: 123, flag: null };
    }
}