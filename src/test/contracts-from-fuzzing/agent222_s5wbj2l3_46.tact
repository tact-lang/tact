struct Alpha {
    a: Int;
    beta: Beta;
}

struct Beta {
    x: Int;
}

contract RefOverwrite {
    val: Alpha;

    init() {
        self.val = Alpha{ a:1, beta: Beta{ x:2 } };
        self.val = Alpha{ a:3, beta: Beta{ x:4 } };
    }
}