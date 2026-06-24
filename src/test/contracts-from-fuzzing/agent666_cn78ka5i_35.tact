struct Classic {
    a: Int;
    b: Bool;
    c: String;
}

contract InitValues {
    cl: Classic = Classic{ a:42, b:true, c:"xyz" };

    init() {
        self.cl = Classic{ a:1, b:false, c:"abc" };
    }
}
