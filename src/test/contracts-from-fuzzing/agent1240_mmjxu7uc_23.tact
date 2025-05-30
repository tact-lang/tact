contract DeepMsgNest {
    root: S1;

    init() {
        self.root = S1{
            s2: S2{
                optMsg: null,
                s3: S3{
                    msg: HelloMsg{ text: "hi" }
                }
            }
        };
    }
}

struct S1 {
    s2: S2;
}

struct S2 {
    optMsg: HelloMsg?;
    s3: S3;
}

struct S3 {
    msg: HelloMsg;
}

message(1) HelloMsg {
    text: String;
}
