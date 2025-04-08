struct NumHolder {
    bigInt: Int;
    smallInt: Int as int8;
}

struct AnnotatedComplex {
    name: String;
    flag: Bool;
    nums: NumHolder;
    score: Int as uint16;
}

contract SerializeFields {
    data: AnnotatedComplex;

    init() {
        self.data = AnnotatedComplex{
            name: "hi",
            flag: true,
            nums: NumHolder{
                bigInt: 1000,
                smallInt: 2,
            },
            score: 999,
        };
    }
}