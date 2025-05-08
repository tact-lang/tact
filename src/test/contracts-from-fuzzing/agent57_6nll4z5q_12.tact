struct SomeData {
    a: Int as uint4;
    b: Int as int5;
    c: Int as uint6;
}

contract AnnotStructHolder {
    data: SomeData;

    init() {
        self.data = SomeData{
            a: 7,
            b: -15,
            c: 45
        };
    }
}