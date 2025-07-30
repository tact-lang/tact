struct ABool {
    a: Int;
    b: Bool;
}

contract MutateInit {
    val: ABool;

    init() {
        self.val = ABool { a:1, b:false };
        self.val = ABool { a:2, b:true };
    }
}
