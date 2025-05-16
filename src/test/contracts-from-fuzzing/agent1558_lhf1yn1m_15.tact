struct S1 { f1: Int; f2: Bool; }
struct S2 { f3: Int?; f4: Bool?; }
struct S3 { f5: String; f6: String?; }

struct Combine {
    s1: S1;
    s2: S2;
    s3: S3;
    num: Int;
    flag: Bool;
    note: String;
}

contract MultipleStructs {
    comb: Combine;

    init() {
        self.comb = Combine{
            s1: S1{f1:1, f2:true},
            s2: S2{f3:null, f4:null},
            s3: S3{f5:"hi", f6:null},
            num: 99,
            flag: false,
            note: "hello",
        };
    }
}
