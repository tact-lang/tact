struct DeepStructOpt {
    arr: Bool?;
    val: Int?;
    inner: SubOpt?;
}

struct SubOpt {
    flag: Bool?;
    num: Int?;
}

contract OptDeepFields {
    s: DeepStructOpt?;
    init() {
        self.s = null;
    }
    receive() {
        if (self.s != null) {
            let _ = self.s!!;
        }
    }
}