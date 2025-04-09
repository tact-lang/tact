struct ZeroTypes {
    one: Int;
}

struct OneOptional {
    a: ZeroTypes?;
}

struct TwoOptional {
    a: OneOptional?;
}

contract TestDeepNulls {
    data: TwoOptional;

    init() {
        self.data = TwoOptional{a: null};
    }

    receive() {
        let tmp = self.data;
    }
}