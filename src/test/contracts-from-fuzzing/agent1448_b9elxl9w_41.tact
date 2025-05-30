struct ABC {
    a: Int;
    b: Bool;
    c: String;
}

contract SimplePerm {
    storage: ABC;

    init() {
        self.storage = ABC{ a:1, b:true, c:"x" };
    }
}