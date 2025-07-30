// Very deep nesting with optional fields
struct S4 {
    k: Int;
    s: String?;
}

struct S3 {
    s4: S4;
    flag: Bool?;
}

struct S2 {
    s3: S3;
    text: String;
}

struct S1 {
    s2: S2;
    enabled: Bool;
}

contract TestContract {
    root: S1;

    init() {
        self.root = S1{
            s2: S2{
                s3: S3{
                    s4: S4{k:5,s:null},
                    flag:true
                },
                text: "hi"
            },
            enabled: false
        };
    }
}