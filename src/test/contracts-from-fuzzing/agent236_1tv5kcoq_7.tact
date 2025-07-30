struct S1 {
    s: String;
    next: S2?;
}

struct S2 {
    flag: Bool;
    next: S3?;
}

struct S3 {
    x: Int;
}

contract ChainOfOptionalNestedStructs {
    data: S1;

    init() {
        self.data = S1{
            s: "start",
            next: S2{flag:true, next:null}
        };
    }
}