struct DeepFlatten1 {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
}
struct DeepFlatten2 {
    a: DeepFlatten1;
    b: DeepFlatten1;
    c: DeepFlatten1;
    d: DeepFlatten1;
}

contract DeepFlattenContract {
    big: DeepFlatten2;

    init() {
        self.big = DeepFlatten2{
            a: DeepFlatten1{f1:1,f2:2,f3:3,f4:4,f5:5},
            b: DeepFlatten1{f1:6,f2:7,f3:8,f4:9,f5:10},
            c: DeepFlatten1{f1:11,f2:12,f3:13,f4:14,f5:15},
            d: DeepFlatten1{f1:16,f2:17,f3:18,f4:19,f5:20}
        };
    }
}
