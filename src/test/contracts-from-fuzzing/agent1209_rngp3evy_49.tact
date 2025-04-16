struct Inner {
    s: String;
    f: Bool?;
}

contract MixedStructOpt {
    val: Inner;
    init() {
        self.val = Inner{s: "abc", f: null};
    }
}