struct MixNestedOptional {
    a: Int?;
    b: String?;
}

struct CombineAll {
    p: MixNestedOptional?;
    flag: Bool;
}

contract MixOptionalTest {
    data: CombineAll;

    init() {
        self.data = CombineAll{
            p: null,
            flag: true,
        };
    }
}