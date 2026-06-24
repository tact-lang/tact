// Contract with a struct field plus flat fields
struct InnerFlat {
    foo: Int;
    bar: Bool;
}

contract MixedFlatAndStruct {
    val: InnerFlat;
    count: Int;
    flag: Bool;

    init() {
        self.val = InnerFlat{foo: 1, bar: true};
        self.count = 123;
        self.flag = false;
    }
}