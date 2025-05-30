struct SInner { val: Int }

struct SMiddle {
    arr1: SInner;
    arr2: SInner;
    flag: Bool;
}

contract RepeatedStructFields {
    data: SMiddle;

    init() {
        self.data = SMiddle{
            arr1: SInner{ val: 1 },
            arr2: SInner{ val: 2 },
            flag: true
        };
    }
}
